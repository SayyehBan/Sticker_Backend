using Microsoft.AspNetCore.Mvc;
using SayyehBanTools.ManageFile;

/// <summary>
/// کنترلر برای مدیریت استیکر
/// </summary>
[Route("api/[controller]/[action]")]
[ApiController]
public class StickerController : ControllerBase
{
    private readonly RSticker rSticker;
    /// <summary>
    /// کنترلر برای مدیریت استیکر
    /// </summary>
    /// <param name="rSticker"></param>
    public StickerController(RSticker rSticker)
    {
        this.rSticker = rSticker;
    }
    /// <summary>
    /// حذف  استیکر
    /// </summary>
    /// <param name="StickerID">شناسه استیکر</param>
    /// <param name="OldPhoto">تصویر قدیمی برای حذف</param>
    /// <returns></returns>
    [HttpDelete]
    public async Task<IActionResult> StickersDelete([FromQuery] int StickerID, string OldPhoto)
    {
        try
        {
            int result = await rSticker.StickersDelete(StickerID);
            if (result == 0)
            {
                return NotFound();
            }
            else
            {
                await ManageFiles.DeleteFileServer(AppConstants.BaseRoot + OldPhoto);
                return Content(result.ToString());
            }
        }
        catch (NotFoundException)
        {
            return NotFound("استیکر یافت نشد");
        }
        catch (Exception)
        {
            return StatusCode(500, "خطایی در سرور رخ داده است");
        }
    }
    /// <summary>
    /// یافتن استیکر بر اساس شناسه
    /// </summary>
    /// <param name="StickerID">شناسه استیکر</param>
    /// <returns></returns>
    [HttpGet]
    public async Task<IActionResult> StickersFindByID([FromQuery] int StickerID)
    {
        try
        {
            var result = await rSticker.StickersFindByID(StickerID);
            if (result == null)
            {
                return NotFound();
            }
            else
            {
                return new JsonResult(result);
            }
        }
        catch (NotFoundException)
        {
            return NotFound("استیکر یافت نشد");
        }
        catch (Exception)
        {
            return StatusCode(500, "خطایی در سرور رخ داده است");
        }
    }
    /// <summary>
    /// لیست استیکر ها
    /// </summary>
    /// <returns></returns>
    [HttpGet]
    public async Task<IActionResult> StickersGetAll()
    {
        try
        {
            var result = await rSticker.StickersGetAll();
            return new JsonResult(result);
        }
        catch (NotFoundException)
        {
            return NotFound("استیکر یافت نشد");
        }
        catch (Exception)
        {
            return StatusCode(500, "خطایی در سرور رخ داده است");
        }
    }
    /// <summary>
    /// ثبت استیکر
    /// </summary>
    /// <param name="model"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<IActionResult> StickersInsert([FromForm] VM_Stickers_Insert model)
    {
        if (model.File == null)
        {
            return Content("فایل آپلود نشده است");
        }
        else
        {
            var basePath = AppConstants.DirectStickers;
            var file = model.File;
            var newFilePath = await ManageFiles.UploadFileAsync(basePath, file);
            model.Sticker = newFilePath;
            var result = await rSticker.StickersInsert(model);
            return new JsonResult(result);
        }
    }
    /// <summary>
    /// به‌روزرسانی استیکر
    /// </summary>
    /// <param name="model">مدل اطلاعات</param>
    /// <param name="OldPhoto">تصویر قدیمی</param>
    /// <returns></returns>
    [HttpPut]
    public async Task<IActionResult> StickersUpdate([FromForm] VM_Stickers_Update model, string? OldPhoto)
    {
        if (model.File == null)
        {
            model.Sticker = null;
            var newStiker = await rSticker.StickersUpdate(model);
            return new JsonResult(newStiker);
        }
        else
        {
            await ManageFiles.DeleteFileServer(AppConstants.DirectStickers + OldPhoto);

            var basePath = AppConstants.DirectStickers;
            var file = model.File!;
            var newFilePath = await ManageFiles.UploadFileAsync(basePath, file);
            model.Sticker = newFilePath;
            var result = await rSticker.StickersUpdate(model);
            return new JsonResult(result);

        }
    }
}