using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using RabbitMQ.Client;
using SayyehBanTools.Converter;

/// <summary>
/// کلاس ریپازیتوری استیکر
/// </summary>
public class RSticker : ISticker
{
    /// <summary>
    /// سرویس استیکر
    /// </summary>
    /// <param name="StickerID"></param>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public async Task<int> StickersDelete(int StickerID)
    {
        using (var connection = new SqlConnection(SqlServer.ConnectionString()))
        {
            var sql = "dbo.StickersDelete";
            var parameters = new { StickerID = StickerID };
            var result = await connection.QuerySingleAsync<int>(sql, parameters, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
    /// <summary>
    /// یافتن استیکر برحسب شناسه
    /// </summary>
    /// <param name="StickerID"></param>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public async Task<VM_Stickers?> StickersFindByID(int StickerID)
    {
        using (var connection = new SqlConnection(SqlServer.ConnectionString()))
        {
            var sql = "dbo.StickersFindByID";
            var parameters = new { StickerID = StickerID };
            var result = await connection.QueryFirstOrDefaultAsync<VM_Stickers>(sql, parameters, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
    /// <summary>
    /// نمایش همه استیکر ها
    /// </summary>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public async Task<IEnumerable<VM_Stickers>> StickersGetAll()
    {
        using (var connection = new SqlConnection(SqlServer.ConnectionString()))
        {
            var sql = "dbo.StickersGetAll";
            var result = await connection.QueryAsync<VM_Stickers>(sql, commandType: CommandType.StoredProcedure);
            return result.ToList();
        }
    }
    /// <summary>
    /// ذخیره استیکر
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public async Task<VM_Stickers> StickersInsert(VM_Stickers_Insert model)
    {
        using (var connection = new SqlConnection(SqlServer.ConnectionString()))
        {
            var sql = "dbo.StickersInsert";
            await connection.OpenAsync();
            var parameters = new
            {
                Title = StringExtensions.CleanString(model.Title ?? ""),
                Price = model.Price,
                Description = StringExtensions.CleanString(model.Description ?? ""),
                Sticker = StringExtensions.CleanString(model.Sticker ?? ""),
            };
            var result = await connection.QuerySingleAsync<VM_Stickers>(sql, parameters, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
    /// <summary>
    /// ویرایش استیکر
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public async Task<VM_Stickers> StickersUpdate(VM_Stickers_Update model)
    {
        using (var connection = new SqlConnection(SqlServer.ConnectionString()))
        {
            var sql = "dbo.StickersUpdate";
            var parameters = new
            {
                StickerID = model.StickerID,
                Title = StringExtensions.CleanString(model.Title ?? ""),
                Price = model.Price,
                Description = StringExtensions.CleanString(model.Description ?? ""),
                Sticker = StringExtensions.CleanString(model.Sticker ?? ""),
            };
            await connection.OpenAsync();
            var result = await connection.QuerySingleOrDefaultAsync<VM_Stickers>(sql, parameters, commandType: CommandType.StoredProcedure);
            if (result != null)
            {
                return result;
            }
            else
            {
                throw new Exception("خطا در ویرایش استیکر");
            }
        }
    }
}