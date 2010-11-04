﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DomainModel.Entities;

namespace DomainModel.Services
{
    public interface IOrderSubmitter
    {
        void SubmitOrder(Cart cart);
        void SendEmail(string address);
    }
}
