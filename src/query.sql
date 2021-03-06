CREATE DATABASE STORE_PRODUCT;
USE STORE_PRODUCT;

#VAT TU

CREATE TABLE MATERIALS(
    MATERIAL_ID INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY  ,
    MATERIAL_CODE VARCHAR(100) NOT NULL UNIQUE ,
    MATERIAL_NAME VARCHAR(100) NOT NULL UNIQUE ,
    MATERIAL_UNIT VARCHAR(100) NOT NULL ,
    MATERIAL_PRICE REAL NOT NULL
);

#TON KHO

CREATE TABLE INVENTORYS(
    INVENTORY_ID INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY ,
    INVENTORY_CODE INT ,
    INVENTORY_ORIGINAL INT ,
    INVENTORY_IMPORT INT,
    INVENTORY_EXPORT INT ,
    FOREIGN KEY (INVENTORY_CODE) REFERENCES MATERIALS(MATERIAL_ID)
);

# NHA CUNG CAP

CREATE TABLE VENDORS(
    VENDOR_ID INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY ,
    VENDOR_CODE VARCHAR(100) NOT NULL UNIQUE ,
    VENDOR_NAME VARCHAR(100) NOT NULL UNIQUE ,
    VENDOR_ADDRESS VARCHAR(100) ,
    VENDOR_PHONE VARCHAR(12)
);

#DON DAT

CREATE TABLE ORDERS(
    ORDER_ID INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY ,
    ORDER_CODE VARCHAR(100) UNIQUE NOT NULL ,
    ORDER_CURRENT_DATE DATE ,
    ORDER_VENDOR INT ,
    FOREIGN KEY (ORDER_VENDOR) REFERENCES VENDORS(VENDOR_ID)
);
alter table ORDERS
    add constraint default_contrain default getdate() for order_current_date;
#     alter column ORDER_CURRENT_DATE set default now();

# NHAP

CREATE TABLE COUPONS(
    COUPONS_ID INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY ,
    COUPONS_CODE VARCHAR(100) NOT NULL UNIQUE ,
    COUPONS_DATE DATE,
    COUPONS_ORDERS INT,
    FOREIGN KEY (COUPONS_ORDERS) REFERENCES ORDERS(ORDER_ID)
);

# XUAT

CREATE TABLE DELIVERIES(
    DELIVERIES_ID INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    DELIVERIES_CODE VARCHAR(100)NOT NULL UNIQUE  ,
    DELIVERIES_DATE DATE,
    DELIVERIES_CUSTOMER VARCHAR(100)
);

# CHI TIET DON HANG

CREATE TABLE ORDER_DETAILS(
    ORDER_DETAILS_ID INT UNIQUE AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    ORDER_DETAILS_ORDERS INT REFERENCES ORDERS(ORDER_ID) ,
    ORDER_DETAILS_MATERIALS INT REFERENCES MATERIALS(MATERIAL_ID)  ,
    ORDER_DETAILS_AMOUNT INT NOT NULL
);
alter table order_details
    add foreign key(ORDER_DETAILS_ORDERS) references ORDERS(ORDER_ID),
    add foreign key (ORDER_DETAILS_MATERIALS) references MATERIALS(MATERIAL_ID);


# CHI TIET PHIEU NHAP

CREATE TABLE COUPON_DETAILS(
    COUPON_DETAILS_ID INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY ,
    COUPON_DETAILS_COUPON INT REFERENCES COUPONS(COUPONS_ID),
    COUPON_DETAILS_MATERIAL INT REFERENCES MATERIALS(MATERIAL_ID),
    COUPON_DETAILS_AMOUNT INT NOT NULL ,
    COUPON_DETAILS_NOTE TEXT
);
alter table coupon_details
    add foreign key (COUPON_DETAILS_COUPON) references coupons(COUPONS_ID),
    add foreign key (COUPON_DETAILS_MATERIAL) references MATERIALS(MATERIAL_ID);

# CHI TIET PHIEU XUAT

CREATE TABLE DELIVERY_DETAILS(
    DELIVERY_DETAILS_ID INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY ,
    DELIVERY_DETAILS_DELIVERIES INT REFERENCES DELIVERIES(DELIVERIES_ID),
    DELIVERY_DETAILS_MATERIAL INT REFERENCES MATERIALS(MATERIAL_ID),
    DELIVERY_DETAILS_AMOUNT INT NOT NULL ,
    DELIVERY_DETAILS_NOTE TEXT
);
alter table delivery_details
    add foreign key (DELIVERY_DETAILS_DELIVERIES) references DELIVERIES(DELIVERIES_ID),
    add foreign key (DELIVERY_DETAILS_MATERIAL) references MATERIALS(MATERIAL_ID);

