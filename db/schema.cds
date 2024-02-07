namespace com.satinfotech.marketdb;
using { managed, cuid } from '@sap/cds/common';

    // @assert.unique:{
    //  Businesspartner:[Businesspartner]
    // }
 entity Businesspartner: cuid, managed {
    @title: 'Business partner number'
    number: String(10);
    @title: 'Name'
    name: String(30);
    @title: 'Adress 1'
    addres1: String(100);
    addres2: String(100);
    City: String(20);
    pincode: String(6);
    states: String(30);
    @title :'IS_GSTN_Registered'
    is_gstn_reg:Boolean default false;
    @title: 'Is_Vendor'
    is_vendor:Boolean default false;
    @title: 'IS_custmoer'
    is_customer: Boolean default false;

}



    @cds.persistence.skip
    entity States {
        @title: 'code'
    key code: String(1);
    @title: 'Description'
    description: String(10);

    }