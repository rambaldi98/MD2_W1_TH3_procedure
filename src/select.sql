USE store_product;



# drop procedure abc;
# CREATE PROCEDURE abc( a int,b int ,out c int)   set c = a +b;
# set @c = 0;
# call abc(1,2,@c);
# select @c;

#      procedure abc(IN a int, IN b int, OUT c int) set c = a *b;

#1 so phieu nhap, ma vat tu ,so luong nhap, don gia , thanh tien

select c.COUPONS_CODE,m.MATERIAL_CODE,cd.COUPON_DETAILS_AMOUNT,m.MATERIAL_PRICE,COUPON_DETAILS_AMOUNT*MATERIAL_PRICE as gia
from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL;


CREATE VIEW detail_coupons AS
    (select c.COUPONS_CODE,m.MATERIAL_CODE,cd.COUPON_DETAILS_AMOUNT,m.MATERIAL_PRICE,COUPON_DETAILS_AMOUNT*MATERIAL_PRICE as gia
    from coupon_details as cd
             join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
             join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL);
select * from detail_coupons;


#2 so phieu nhap, ma vat tu ,ten vat tu,so luong nhap, don gia , thanh tien

select c.COUPONS_CODE  'ma nhap',m.MATERIAL_CODE 'ma vat tu',m.MATERIAL_NAME 'ten vat tu',cd.COUPON_DETAILS_AMOUNT 'so luong',m.MATERIAL_PRICE'gia',COUPON_DETAILS_AMOUNT*MATERIAL_PRICE 'thanh tien'
from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL;


create view detail_coupons_up as
select c.COUPONS_CODE  'ma nhap',m.MATERIAL_CODE 'ma vat tu',m.MATERIAL_NAME 'ten vat tu',cd.COUPON_DETAILS_AMOUNT 'so luong',m.MATERIAL_PRICE'gia',COUPON_DETAILS_AMOUNT*MATERIAL_PRICE 'thanh tien'
from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL;
select * from detail_coupons_up;

# 3  so phieu nhap, ngay nhap,so don hang,ma vat tu ,ten vat tu,so luong nhap, don gia , thanh tien

select c.COUPONS_CODE  'ma nhap',c.COUPONS_DATE'ngay nhap',od.ORDER_DETAILS_AMOUNT 'so luong dat',m.MATERIAL_CODE 'ma vat tu',m.MATERIAL_NAME 'ten vat tu',cd.COUPON_DETAILS_AMOUNT 'so luong',m.MATERIAL_PRICE'gia',COUPON_DETAILS_AMOUNT*MATERIAL_PRICE 'thanh tien'
from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL
        join order_details od on m.MATERIAL_ID = od.ORDER_DETAILS_MATERIALS
group by c.COUPONS_CODE, m.MATERIAL_CODE;

create view detail_coupon_pn as
select c.COUPONS_CODE  'ma nhap',c.COUPONS_DATE'ngay nhap',od.ORDER_DETAILS_AMOUNT 'so luong dat',m.MATERIAL_CODE 'ma vat tu',m.MATERIAL_NAME 'ten vat tu',cd.COUPON_DETAILS_AMOUNT 'so luong',m.MATERIAL_PRICE'gia',COUPON_DETAILS_AMOUNT*MATERIAL_PRICE 'thanh tien'
from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL
         join order_details od on m.MATERIAL_ID = od.ORDER_DETAILS_MATERIALS
group by c.COUPONS_CODE, m.MATERIAL_CODE;

select * from detail_coupon_pn;

#4 s??? h??ng, ng??y nh???p , s??? ????n ?????t , vendor, m?? v???t t??, t??n v???t t??, s??? l?????ng nh???p, ????n gi?? nh???p, th??nh ti???n nh???p.

select c.COUPONS_CODE  'ma nhap',c.COUPONS_DATE'ngay nhap',od.ORDER_DETAILS_AMOUNT 'so don dat',v.VENDOR_NAME 'nha cung cap',m.MATERIAL_CODE 'ma vat tu',m.MATERIAL_NAME 'ten vat tu',cd.COUPON_DETAILS_AMOUNT 'so luong',m.MATERIAL_PRICE'gia',COUPON_DETAILS_AMOUNT*MATERIAL_PRICE 'thanh tien'
from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL
         join order_details od on m.MATERIAL_ID = od.ORDER_DETAILS_MATERIALS
        join vendors v on v.VENDOR_ID = c.COUPONS_ID
group by c.COUPONS_CODE, m.MATERIAL_CODE;


create view detail_coupon_vd as
    select c.COUPONS_CODE  'ma nhap',c.COUPONS_DATE'ngay nhap',od.ORDER_DETAILS_AMOUNT 'so don dat',v.VENDOR_NAME 'nha cung cap',m.MATERIAL_CODE 'ma vat tu',m.MATERIAL_NAME 'ten vat tu',cd.COUPON_DETAILS_AMOUNT 'so luong',m.MATERIAL_PRICE'gia',COUPON_DETAILS_AMOUNT*MATERIAL_PRICE 'thanh tien'
    from coupon_details as cd
         join coupons c on c.COUPONS_ID = cd.COUPON_DETAILS_COUPON
         join materials m on m.MATERIAL_ID = cd.COUPON_DETAILS_MATERIAL
         join order_details od on m.MATERIAL_ID = od.ORDER_DETAILS_MATERIALS
         join vendors v on v.VENDOR_ID = c.COUPONS_ID
    group by c.COUPONS_CODE, m.MATERIAL_CODE;

select * from detail_coupon_vd;

# 7 s??? phi???u xuat , m?? v???t t??, s??? l?????ng, ????n gi??, th??nh ti???n.

select d.DELIVERIES_CODE,m.MATERIAL_CODE,dd.DELIVERY_DETAILS_AMOUNT,DELIVERY_DETAILS_AMOUNT*m.MATERIAL_PRICE
from delivery_details dd
        join deliveries d on d.DELIVERIES_ID = dd.DELIVERY_DETAILS_DELIVERIES
        join materials m on dd.DELIVERY_DETAILS_MATERIAL = m.MATERIAL_ID;

create view detail_deliveries as
select d.DELIVERIES_CODE,m.MATERIAL_CODE,dd.DELIVERY_DETAILS_AMOUNT,DELIVERY_DETAILS_AMOUNT*m.MATERIAL_PRICE
from delivery_details dd
         join deliveries d on d.DELIVERIES_ID = dd.DELIVERY_DETAILS_DELIVERIES
         join materials m on dd.DELIVERY_DETAILS_MATERIAL = m.MATERIAL_ID;

select * from detail_deliveries;



# 1 create store procedure t???ng s??? l?????ng cu???i v???t t?? v???i m?? v???t t??

select m.MATERIAL_CODE , i.INVENTORY_ORIGINAL
from materials m join inventorys i on m.MATERIAL_ID = i.INVENTORY_CODE;

create procedure get_meterial_invenstory()
begin
    select m.MATERIAL_CODE , i.INVENTORY_ORIGINAL
    from materials m join inventorys i on m.MATERIAL_ID = i.INVENTORY_CODE;
end;

call get_meterial_invenstory();

#2 T???o SP cho bi???t t???ng ti???n xu???t c???a v???t t?? v???i m?? v???t t?? l?? tham s??? v??o.

select m.MATERIAL_CODE, sum(m.MATERIAL_PRICE*dd.DELIVERY_DETAILS_AMOUNT)
from
    delivery_details dd join materials m on dd.DELIVERY_DETAILS_MATERIAL = m.MATERIAL_ID
where m.MATERIAL_CODE = 'MVT-01';

create procedure get_money_by_mvt(in mvt varchar(100))
begin
    select m.MATERIAL_CODE, sum(m.MATERIAL_PRICE*dd.DELIVERY_DETAILS_AMOUNT)
    from
        delivery_details dd join materials m on dd.DELIVERY_DETAILS_MATERIAL = m.MATERIAL_ID
    where m.MATERIAL_CODE = mvt;
end;

call get_money_by_mvt('mvt-03');

# 3 T???o SP cho bi???t t???ng s??? l?????ng ?????t theo s??? ????n h??ng v???i s??? ????n h??ng l?? tham s??? v??o.

select m.MATERIAL_CODE, sum(od.ORDER_DETAILS_AMOUNT)
from
    order_details od join materials m on od.ORDER_DETAILS_MATERIALS = m.MATERIAL_ID
where m.MATERIAL_CODE = 'MVT-02';

create procedure get_order_amount_by_mvt(in mvt varchar(100))
    begin
        select m.MATERIAL_CODE, sum(od.ORDER_DETAILS_AMOUNT)
        from
            order_details od join materials m on od.ORDER_DETAILS_MATERIALS = m.MATERIAL_ID
        where m.MATERIAL_CODE = mvt;
    end;
call get_order_amount_by_mvt('mvt-02');

#4 tao sp them mot don hang
drop procedure add_new_order;

create procedure add_new_order(in order_cod varchar(100),in date date,in vendor int)
begin
    insert into orders(ORDER_CODE, ORDER_CURRENT_DATE, ORDER_VENDOR) value (order_cod,date,vendor);
end;

call add_new_order('order-04','2021-05-21',3);



create procedure update_order(in id int ,in order_code varchar(100),in date date,in vendor int)
    begin
        update orders
            set ORDER_ID = id,
                ORDER_CURRENT_DATE = date,
                ORDER_CODE = order_code,
                ORDER_VENDOR = vendor
        where ORDER_ID = id;
    end;

#5tao sp them 1 don dat

create procedure add_new_daily_orders(in id_order int, in id_material int, in amount int)
    begin
        insert into order_details(ORDER_DETAILS_ORDERS, ORDER_DETAILS_MATERIALS, ORDER_DETAILS_AMOUNT) VALUE
        (id_order,id_material,amount);
    end;


