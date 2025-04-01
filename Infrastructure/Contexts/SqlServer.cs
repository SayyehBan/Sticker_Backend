using Microsoft.Data.SqlClient;

/// <summary>
/// کلاس تنظیمات اتصال به پایگاه داده SQL Server
/// </summary>
public class SqlServer
{
    /// <summary>
    /// ایجاد رشته اتصال به پایگاه داده
    /// </summary>
    /// <returns>رشته اتصال به SQL Server</returns>
    public static string ConnectionString()
    {
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        builder.DataSource = ".";
        builder.InitialCatalog = "DB_Stickers";
        builder.UserID = "TestConnection";
        builder.Password = "@123456";
        builder.ConnectTimeout = 0;
        builder.MaxPoolSize = 20000;
        builder.IntegratedSecurity = false;
        builder.TrustServerCertificate = true;
        return builder.ConnectionString.ToString();
    }
}
