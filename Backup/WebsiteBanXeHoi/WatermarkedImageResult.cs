using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace WebsiteBanXeHoi
{
    public class WatermarkedImageResult: ActionResult
    {
        public string ImageFileName { get; private set; }
        public string WatermarkText { get; private set; }
        public string WatermarkAuthorText { get; private set; }

        public WatermarkedImageResult(string imageFileName, string watermarkText , string watermarkAuthorText )
        {
            ImageFileName = imageFileName;
            WatermarkText = watermarkText;
            WatermarkAuthorText = watermarkAuthorText;
        }

        public override void ExecuteResult(ControllerContext context)
        {
           
            var response = context.RequestContext.HttpContext.Response;
            try
            {
                using (var image = Image.FromFile(ImageFileName))
                using (var graphics = Graphics.FromImage(image))
                using (var font = new Font("Arial", 20))
                using (var font_author = new Font("Arial", 8))
                using (var memoryStream = new MemoryStream())
                {
                    // Render the watermark text in bottom-left corner
                    var textSize = graphics.MeasureString(WatermarkText, font);
                    graphics.DrawString(WatermarkText, font, Brushes.White, 10, image.Height - textSize.Height - 10);
                    graphics.DrawString(WatermarkAuthorText, font_author, Brushes.White, 10, image.Height - textSize.Height - 20);
                    // Transmit the image in PNG format (note: must buffer it in 
                    // memory first due to GDI+ limitation)
                    image.Save(memoryStream, ImageFormat.Png);
                    response.ContentType = "image/png";
                    response.BinaryWrite(memoryStream.GetBuffer());
                }
            }
            catch
            {

                response.Write("Chưa có");
            }

        }
    }
}
