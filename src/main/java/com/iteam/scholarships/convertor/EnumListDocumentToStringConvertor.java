package com.iteam.scholarships.convertor;

import com.iteam.scholarships.enums.ScholarshipE;

import javax.persistence.AttributeConverter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class EnumListDocumentToStringConvertor extends EnumListToStringConvertor<ScholarshipE.RequiredDocument>{

    public EnumListDocumentToStringConvertor() {
        super.className = ScholarshipE.RequiredDocument.class;
    }
}
