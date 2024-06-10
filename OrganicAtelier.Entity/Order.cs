﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.Entity
{

    public enum EnumOrderState
    {
        Waited,
        Completed,
        Unpaid
    }

    public enum EnumPaymentType
    {
        EFT,
        CreditCart
    }

    public class Order
    {
        //stripe
        //IYZICO

        public int Id { get; set; }

        public string OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public string UserId { get; set; }

        public EnumOrderState OrderState { get; set; }
        public EnumPaymentType PaymentType { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string OrderNote { get; set; }

        //Ödeme Api
        public string PaymentId { get; set; }
        public string PaymentToken { get; set; }
        public string ConversationId { get; set; }


        public List<OrderItem> OrderItems { get; set; }

        public Order()
        {
            OrderItems = new List<OrderItem>();
        }
    }
}
