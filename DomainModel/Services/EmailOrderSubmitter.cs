using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainModel.Entities;
using System.Net.Mail;
using System.Net;

namespace DomainModel.Services
{
    public class EmailOrderSubmitter : IOrderSubmitter
    {
        const string MailSubject = "Hoàn tất quá trình mua xe!";
        string smtpServer, serverport, mailFrom, pass;

        public EmailOrderSubmitter(string smtpServer, string serverport, string mailFrom, string pass)
        {
            this.smtpServer = smtpServer;
            this.serverport = serverport;
            this.mailFrom = mailFrom;
            this.pass = pass;
        }

        public void SubmitOrder(Cart cart)
        {
            StringBuilder body = new StringBuilder();
            body.AppendLine("Bạn đã đăng kí đơn đặt hàng này:");
            body.AppendLine("----------------------------------");
            body.AppendLine("Danh sách xe được mua:");
            foreach (var line in cart.Lines)
            {
                var subtotal = line.Product.Price * line.Quantity;
                body.AppendFormat("         {0} x {1} (Thành tiền: {2:c})" + Environment.NewLine, line.Quantity,line.Product.Name,subtotal);
            }
            body.AppendLine("----------------------------------");
            body.AppendFormat("Tổng tiền thanh toán: {0:c}" + Environment.NewLine, cart.ComputeTotalValue());
            body.AppendLine("--------***---------");
            body.AppendLine("Hàng hóa được chuyển đến:");
            body.AppendLine(cart.ShippingDetails.Name);
            body.AppendLine(cart.ShippingDetails.BirthOfDay.ToShortDateString());
            body.AppendLine(cart.ShippingDetails.Career ?? "");
            body.AppendLine(cart.ShippingDetails.Address ?? "");
            body.AppendLine(cart.ShippingDetails.City);
            body.AppendLine(cart.ShippingDetails.State ?? "");
            body.AppendLine(cart.ShippingDetails.Country);
            body.AppendLine(cart.ShippingDetails.Zip);
            body.AppendLine("---------***---------");
            body.AppendFormat("Nhận quà: {0}"+Environment.NewLine,cart.ShippingDetails.GiftWrap ? "Có" : "Không");
            body.AppendLine("---------***---------");
            body.AppendLine("Cám ơn bạn đã tin tưởng đặt mua hàng tại website chúng tôi!");
            body.AppendLine("Trân trọng kính chào quý khách.");
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Credentials = new NetworkCredential(mailFrom, pass);
            smtpClient.Port = int.Parse(serverport);
            smtpClient.Host = smtpServer;
            smtpClient.EnableSsl = true;
            smtpClient.Send(new MailMessage(mailFrom, cart.ShippingDetails.Email , MailSubject,body.ToString()));
        }

        public void SendEmail(string address)
        {
            StringBuilder body = new StringBuilder();
            body.AppendLine("Đã có người (bạn) đăng nhập vào tài khoản sai trên 3 lần");
            body.AppendLine("----------------------------------");
            body.AppendLine("Chúng tôi nâng mức báo động về tài khoản!");
            body.AppendLine("----------------------------------");
            body.AppendLine("Vui lòng rà soát thông tin về tài khoản quản lý website");
            body.AppendLine("----------------------------------");
            body.AppendLine("Bạn nên đổi mật khẩu nếu cần thiết");
            body.AppendLine("----------------------------------");
            body.AppendLine("Administrator");          
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Credentials = new NetworkCredential(mailFrom, pass);
            smtpClient.Port = int.Parse(serverport);
            smtpClient.Host = smtpServer;
            smtpClient.EnableSsl = true;
            smtpClient.Send(new MailMessage(mailFrom, address, "Cảnh báo tài khoản", body.ToString()));
        }
    }
}
