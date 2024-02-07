using { com.satinfotech.marketdb as db} from '../db/schema';

service marketDB {
    entity Businesspartner as projection on db.Businesspartner;
    entity States as projection on db.States;
}

annotate marketDB.Businesspartner with @odata.draft.enabled;
annotate marketDB.States with @odata.draft.enabled;


annotate marketDB.Businesspartner with {
    pincode     @assert.format: '^[1-9]{1}[0-9]{2}\$//s{0, 1}[0-9]{3}$';

}


annotate marketDB.Businesspartner with @(
    UI.LineItem :[
        {
            Value : number
        },
        {
            Value : name
        },
        {
            Value : addres1
        },
        {
            Value : addres2
        },
        {
            Value: City
        },
        {
            Value : states
        },
        {
            Value: pincode
        },
        {
            Value : is_gstn_reg
        },
        {
            Value : is_vendor
        },
        {
            Value: is_customer
        }
    ],
     UI.SelectionFields: [ name , pincode, number],    
    UI.FieldGroup #BusinesspartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label: 'NUmber',
                Value : number,
            },
            {
                $Type : 'UI.DataField',
                Value : addres1,
            },
            {
                $Type : 'UI.DataField',
                Label: 'Address2',
                Value : addres2,
            },
            {
                $Type : 'UI.DataField',
                Label: 'Pincode',
                Value : pincode,
            },
            {
                $Type : 'UI.DataField',
                Label: 'States',
                Value : states,
            },
          
        ],
    },
      UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinesspartnerInfoFacet',
            Label : 'BusinesspartnerInformation',
            Target : '@UI.FieldGroup#BusinesspartnerInformation',
        }
      ]
);

annotate marketDB.Businesspartner with {
    states @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'States',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : states,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
}