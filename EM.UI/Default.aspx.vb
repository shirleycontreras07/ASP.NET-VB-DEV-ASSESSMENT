
Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadEmployeeType()
            LoadEmployeeGrid()
        Else

            Dim target As String = Request("__EVENTTARGET")
            Dim parameter As String = Request("__EVENTARGUMENT")

            If target = "ButtonSubmit" Then
                ButtonSubmit_Click()
            ElseIf target = "ButtonSubmitEdition" Then
                ButtonSubmitEdition_Click()
            End If

        End If
    End Sub

#Region "Load Info"
    Protected Sub LoadEmployeeType()
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "[dbo].[GetEmployeeTypes]"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        Dim dt As DataTable = New DataTable()
        Dim adp As SqlDataAdapter = New SqlDataAdapter(cmd)
        adp.Fill(dt)
        DropDownEmployeeType.DataValueField = "Code"
        DropDownEmployeeType.DataTextField = "Definition"
        DropDownEmployeeType.DataSource = dt
        DropDownEmployeeType.DataBind()
        DropDownEmployeeType.Items.Insert(0, New ListItem("- Select type -", 0))
        conn.Close()
    End Sub

    Protected Sub LoadEmployeeGrid()
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "[dbo].[GetEmployees]"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        Dim dt As DataTable = New DataTable()
        Dim adp As SqlDataAdapter = New SqlDataAdapter(cmd)
        adp.Fill(dt)
        gvwEmployee.DataSource = dt
        gvwEmployee.DataBind()
        conn.Close()
    End Sub

    Protected Sub LoadEmployeeById(ByVal ID As Integer)
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "[dbo].[GetEmployeeByID]"
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        cmd.Parameters.AddWithValue("@ID", ID)
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.HasRows Then

            While reader.Read()
                EmployeeId.Value = reader.GetInt32(0)
                TextBoxFirstName.Text = reader.GetString(1)
                TextBoxSecondName.Text = reader.GetString(2)
                TextBoxPhoneNumber.Text = reader.GetString(3)
                DropDownEmployeeType.SelectedValue = reader.GetString(4)
            End While
        End If

        reader.Close()
        conn.Close()
    End Sub
#End Region

#Region "CRUD Actions"
    Protected Sub AddEmployee(ByVal record As Employee)
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "[dbo].[InsertEmployee]"
        cmd.Parameters.AddWithValue("@FirstName", record.FirstName)
        cmd.Parameters.AddWithValue("@SecondName", record.SecondName)
        cmd.Parameters.AddWithValue("@PhoneNumber", record.PhoneNumber)
        cmd.Parameters.AddWithValue("@EmployeeType", record.EmployeeType)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Protected Sub UpdateEmployee(ByVal record As Employee)
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "[dbo].[UpdateEmployee]"
        cmd.Parameters.AddWithValue("@ID", record.ID)
        cmd.Parameters.AddWithValue("@FirstName", record.FirstName)
        cmd.Parameters.AddWithValue("@SecondName", record.SecondName)
        cmd.Parameters.AddWithValue("@PhoneNumber", record.PhoneNumber)
        cmd.Parameters.AddWithValue("@EmployeeType", record.EmployeeType)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Protected Sub DeleteEmployee(ByVal ID As Integer)
        conn.Open()
        Dim cmd As SqlCommand = New SqlCommand()
        cmd.CommandText = "[dbo].[DeleteEmployee]"
        cmd.Parameters.AddWithValue("@ID", ID)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Connection = conn
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub
#End Region

#Region "Events"
    Protected Sub ButtonSubmit_Click()
        Dim employee As Employee = MapEmployee()
        AddEmployee(employee)
        CleanValues()
        LoadEmployeeGrid()
        UpdatePanelProject.Update()
    End Sub

    Protected Sub btnDelete_Command(sender As Object, e As CommandEventArgs)
        Dim Id As Integer = Convert.ToInt32(e.CommandArgument.ToString())
        DeleteEmployee(Id)
        LoadEmployeeGrid()
        UpdatePanelProject.Update()
    End Sub

    Protected Sub btnEdit_Command(sender As Object, e As CommandEventArgs)
        LoadEmployeeById(Convert.ToInt32(e.CommandArgument.ToString()))
        ButtonSubmit.Visible = False
        ButtonSubmitEdition.Visible = True
    End Sub

    Protected Sub ButtonSubmitEdition_Click()
        Dim employee As Employee = MapEmployee()
        UpdateEmployee(employee)
        CleanValues()
        LoadEmployeeGrid()
        UpdatePanelProject.Update()
    End Sub

    Protected Sub CancelButton_Click(sender As Object, e As EventArgs)
        CleanValues()
    End Sub
#End Region

#Region "Helpers"
    Protected Function MapEmployee() As Employee
        Dim record As Employee = New Employee()
        record.ID = If(EmployeeId.Value = String.Empty, 0, Convert.ToInt32(EmployeeId.Value))
        record.FirstName = TextBoxFirstName.Text.Trim()
        record.SecondName = TextBoxSecondName.Text.Trim()
        record.PhoneNumber = TextBoxPhoneNumber.Text.Trim()
        record.EmployeeType = DropDownEmployeeType.SelectedValue.ToString()

        Return record
    End Function

    Protected Sub CleanValues()
        TextBoxFirstName.Text = String.Empty
        TextBoxSecondName.Text = String.Empty
        TextBoxPhoneNumber.Text = String.Empty
        DropDownEmployeeType.SelectedValue = 0
        ButtonSubmit.Visible = True
        ButtonSubmitEdition.Visible = False
    End Sub
#End Region



End Class