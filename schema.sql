-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/A0vAPe
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "CardHolder" (
    "cardholder_ID" int   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_CardHolder" PRIMARY KEY (
        "cardholder_ID"
     )
);

CREATE TABLE "CreditCard" (
    "card_number" VARCHAR(20)   NOT NULL,
    "ch.CardHolderID" int   NOT NULL
);

CREATE TABLE "MerchantCategory" (
    "cat_ID" int   NOT NULL,
    "merchant_type" str   NOT NULL,
    CONSTRAINT "pk_MerchantCategory" PRIMARY KEY (
        "cat_ID"
     )
);

CREATE TABLE "Merchant" (
    "merchant_ID" int   NOT NULL,
    "merchant_name" str   NOT NULL,
    "mc.CATID" int   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "merchant_ID"
     )
);

CREATE TABLE "Transaction" (
    "tran_ID" int   NOT NULL,
    "date" timestamp   NOT NULL,
    "amount" float   NOT NULL,
    "card_number" VARCHAR(20)   NOT NULL,
    "m.merchant_ID" int   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "tran_ID"
     )
);

ALTER TABLE "CardHolder" ADD CONSTRAINT "fk_CardHolder_cardholder_ID" FOREIGN KEY("cardholder_ID")
REFERENCES "CreditCard" ("ch.CardHolderID");

ALTER TABLE "CreditCard" ADD CONSTRAINT "fk_CreditCard_ch.CardHolderID" FOREIGN KEY("ch.CardHolderID")
REFERENCES "Transaction" ("card_number");

ALTER TABLE "MerchantCategory" ADD CONSTRAINT "fk_MerchantCategory_cat_ID" FOREIGN KEY("cat_ID")
REFERENCES "Merchant" ("mc.CATID");

ALTER TABLE "Merchant" ADD CONSTRAINT "fk_Merchant_merchant_ID" FOREIGN KEY("merchant_ID")
REFERENCES "Transaction" ("m.merchant_ID");

