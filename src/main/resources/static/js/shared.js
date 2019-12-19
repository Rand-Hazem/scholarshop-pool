var countryMap = {
    "AF": "Afghanistan",
    "AX": "Åland Islands",
    "AL": "Albania",
    "DZ": "Algeria",
    "AS": "American Samoa",
    "AD": "Andorra",
    "AO": "Angola",
    "AI": "Anguilla",
    "AQ": "Antarctica",
    "AG": "Antigua and Barbuda",
    "AR": "Argentina",
    "AM": "Armenia",
    "AW": "Aruba",
    "AU": "Australia",
    "AT": "Austria",
    "AZ": "Azerbaijan",
    "BS": "Bahamas",
    "BH": "Bahrain",
    "BD": "Bangladesh",
    "BB": "Barbados",
    "BY": "Belarus",
    "BE": "Belgium",
    "BZ": "Belize",
    "BJ": "Benin",
    "BM": "Bermuda",
    "BT": "Bhutan",
    "BO": "Bolivia",
    "BA": "Bosnia and Herzegovina",
    "BW": "Botswana",
    "BV": "Bouvet Island",
    "BR": "Brazil",
    "IO": "British Indian Ocean Territory",
    "BN": "Brunei Darussalam",
    "BG": "Bulgaria",
    "BF": "Burkina Faso",
    "BI": "Burundi",
    "KH": "Cambodia",
    "CM": "Cameroon",
    "CA": "Canada",
    "CV": "Cape Verde",
    "KY": "Cayman Islands",
    "CF": "Central African Republic",
    "TD": "Chad",
    "CL": "Chile",
    "CN": "China",
    "CX": "Christmas Island",
    "CC": "Cocos (Keeling) Islands",
    "CO": "Colombia",
    "KM": "Comoros",
    "CG": "Congo",
    "CD": "Congo, The Democratic Republic of The",
    "CK": "Cook Islands",
    "CR": "Costa Rica",
    "CI": "Cote D'ivoire",
    "HR": "Croatia",
    "CU": "Cuba",
    "CY": "Cyprus",
    "CZ": "Czechia",
    "DK": "Denmark",
    "DJ": "Djibouti",
    "DM": "Dominica",
    "DO": "Dominican Republic",
    "EC": "Ecuador",
    "EG": "Egypt",
    "SV": "El Salvador",
    "GQ": "Equatorial Guinea",
    "ER": "Eritrea",
    "EE": "Estonia",
    "ET": "Ethiopia",
    "FK": "Falkland Islands (Malvinas)",
    "FO": "Faroe Islands",
    "FJ": "Fiji",
    "FI": "Finland",
    "FR": "France",
    "GF": "French Guiana",
    "PF": "French Polynesia",
    "TF": "French Southern Territories",
    "GA": "Gabon",
    "GM": "Gambia",
    "GE": "Georgia",
    "DE": "Germany",
    "GH": "Ghana",
    "GI": "Gibraltar",
    "GR": "Greece",
    "GL": "Greenland",
    "GD": "Grenada",
    "GP": "Guadeloupe",
    "GU": "Guam",
    "GT": "Guatemala",
    "GG": "Guernsey",
    "GN": "Guinea",
    "GW": "Guinea-bissau",
    "GY": "Guyana",
    "HT": "Haiti",
    "HM": "Heard Island and Mcdonald Islands",
    "VA": "Holy See (Vatican City State)",
    "HN": "Honduras",
    "HK": "Hong Kong",
    "HU": "Hungary",
    "IS": "Iceland",
    "IN": "India",
    "ID": "Indonesia",
    "IR": "Iran, Islamic Republic of",
    "IQ": "Iraq",
    "IE": "Ireland",
    "IM": "Isle of Man",
    "IL": "Israel",
    "IT": "Italy",
    "JM": "Jamaica",
    "JP": "Japan",
    "JE": "Jersey",
    "JO": "Jordan",
    "KZ": "Kazakhstan",
    "KE": "Kenya",
    "KI": "Kiribati",
    "KP": "Korea, Democratic People's Republic of",
    "KR": "Korea, Republic of",
    "KW": "Kuwait",
    "KG": "Kyrgyzstan",
    "LA": "Lao People's Democratic Republic",
    "LV": "Latvia",
    "LB": "Lebanon",
    "LS": "Lesotho",
    "LR": "Liberia",
    "LY": "Libyan Arab Jamahiriya",
    "LI": "Liechtenstein",
    "LT": "Lithuania",
    "LU": "Luxembourg",
    "MO": "Macao",
    "MK": "Macedonia, The Former Yugoslav Republic of",
    "MG": "Madagascar",
    "MW": "Malawi",
    "MY": "Malaysia",
    "MV": "Maldives",
    "ML": "Mali",
    "MT": "Malta",
    "MH": "Marshall Islands",
    "MQ": "Martinique",
    "MR": "Mauritania",
    "MU": "Mauritius",
    "YT": "Mayotte",
    "MX": "Mexico",
    "FM": "Micronesia, Federated States of",
    "MD": "Moldova, Republic of",
    "MC": "Monaco",
    "MN": "Mongolia",
    "ME": "Montenegro",
    "MS": "Montserrat",
    "MA": "Morocco",
    "MZ": "Mozambique",
    "MM": "Myanmar",
    "NA": "Namibia",
    "NR": "Nauru",
    "NP": "Nepal",
    "NL": "Netherlands",
    "AN": "Netherlands Antilles",
    "NC": "New Caledonia",
    "NZ": "New Zealand",
    "NI": "Nicaragua",
    "NE": "Niger",
    "NG": "Nigeria",
    "NU": "Niue",
    "NF": "Norfolk Island",
    "MP": "Northern Mariana Islands",
    "NO": "Norway",
    "OM": "Oman",
    "PK": "Pakistan",
    "PW": "Palau",
    "PS": "Palestinian Territory, Occupied",
    "PA": "Panama",
    "PG": "Papua New Guinea",
    "PY": "Paraguay",
    "PE": "Peru",
    "PH": "Philippines",
    "PN": "Pitcairn",
    "PL": "Poland",
    "PT": "Portugal",
    "PR": "Puerto Rico",
    "QA": "Qatar",
    "RE": "Reunion",
    "RO": "Romania",
    "RU": "Russian Federation",
    "RW": "Rwanda",
    "SH": "Saint Helena",
    "KN": "Saint Kitts and Nevis",
    "LC": "Saint Lucia",
    "PM": "Saint Pierre and Miquelon",
    "VC": "Saint Vincent and The Grenadines",
    "WS": "Samoa",
    "SM": "San Marino",
    "ST": "Sao Tome and Principe",
    "SA": "Saudi Arabia",
    "SN": "Senegal",
    "RS": "Serbia",
    "SC": "Seychelles",
    "SL": "Sierra Leone",
    "SG": "Singapore",
    "SK": "Slovakia",
    "SI": "Slovenia",
    "SB": "Solomon Islands",
    "SO": "Somalia",
    "ZA": "South Africa",
    "GS": "South Georgia and The South Sandwich Islands",
    "ES": "Spain",
    "LK": "Sri Lanka",
    "SD": "Sudan",
    "SR": "Suriname",
    "SJ": "Svalbard and Jan Mayen",
    "SZ": "Swaziland",
    "SE": "Sweden",
    "CH": "Switzerland",
    "SY": "Syrian Arab Republic",
    "TW": "Taiwan, Province of China",
    "TJ": "Tajikistan",
    "TZ": "Tanzania, United Republic of",
    "TH": "Thailand",
    "TL": "Timor-leste",
    "TG": "Togo",
    "TK": "Tokelau",
    "TO": "Tonga",
    "TT": "Trinidad and Tobago",
    "TN": "Tunisia",
    "TR": "Turkey",
    "TM": "Turkmenistan",
    "TC": "Turks and Caicos Islands",
    "TV": "Tuvalu",
    "UG": "Uganda",
    "UA": "Ukraine",
    "AE": "United Arab Emirates",
    "UK": "United Kingdom",
    "US": "United States",
    "UM": "United States Minor Outlying Islands",
    "UY": "Uruguay",
    "UZ": "Uzbekistan",
    "VU": "Vanuatu",
    "VE": "Venezuela",
    "VN": "Viet Nam",
    "VG": "Virgin Islands, British",
    "VI": "Virgin Islands, U.S.",
    "WF": "Wallis and Futuna",
    "EH": "Western Sahara",
    "YE": "Yemen",
    "ZM": "Zambia",
    "ZW": "Zimbabwe"
};


var majorsMap = {
    "any": "Any",
    "AG": "Agriculture, General",
    "ARGOP": "Agribusiness Operations",
    "ARGBM": "Agricultural Business & Management",
    "ARGEC": "Agricultural Economics",
    "ARGM": "Agricultural Mechanization",
    "ARGPR": "Agricultural Production",
    "ACS": "Agronomy & Crop Science",
    "ANS": "Animal Sciences",
    "FST": "Food Sciences & Technology",
    "HORTOM": "Horticulture Operations & Management",
    "HORTS": "Horticulture Science",
    "NRCG": "Natural Resources Conservation, General",
    "ENVS": "Environmental Science",
    "FRS": "Forestry",
    "NRM": "Natural Resources Management",
    "WWM": "Wildlife & Wildlands Management",
    "ARCH": "Architecture, General",
    "AED": "Architectural Environmental Design",
    "CURP": "City/Urban/Regional Planning",
    "IARCH": "Interior Architecture",
    "LARCH": "Landscape Architecture",
    "ASG": "Area Studies, General (e.g., African, Middle Eastern)",
    "AAS": "Asian Area Studies",
    "EAS": "European Area Studies",
    "LAASC": "Latin American Area Studies",
    "NAAS": "North American Area Studies",
    "EMSG": "Ethnic & Minority Studies, General",
    "AMS": "African American Studies",
    "AINAS": "American Indian/Native American Studies",
    "LCS": "Latino/Chicano Studies",
    "WS": "Women’s Studies",
    "LAGS": "Liberal Arts & General Studies",
    "LSC": "Library Science",
    "MINS": "Multi/Interdisciplinary Studies",
    "ARTG": "Art, General ",
    "AHCC": "Art History, Criticism & Conservation ",
    "WFSA": "Fine/Studio Arts ",
    "CF": "Cinema/Film ",
    "CFVP": "Cinematography/Film/Video Production ",
    "DNC": "Dance",
    "DVCG": "Design & Visual Communications, General",
    "FAD": "Fashion/Apparel Design",
    "GD": "Graphic Design",
    "ID": "Industrial Design",
    "INTD": "Interior Design",
    "MUG": "Music, General",
    "MUP": "Music, Performance",
    "MTC": "Music, Theory & Composition",
    "PHG": "Photography",
    "TAD": "Theatre Arts/Drama",
    "ACTG": "Accounting",
    "ACTGT": "Accounting Technician",
    "BAMG": "Business Administration & Management, General",
    "HMM": "Hotel/Motel Management",
    "<option value=HRDT": "Human Resources Development/Training",
    "HRM": "Human Resources Management",
    "IBM": "International Business Management",
    "LIR": "Labor/Industrial Relations",
    "LMM": "Logistics & Materials Management",
    "MMR": "Marketing Management & Research",
    "OSM": "Office Supervision & Management",
    "OMS": "Operations Management & Supervision",
    "ORGB": "Organizational Behaviour",
    "PPCM": "Purchasing/Procurement/Contracts Management",
    "RFSM": "Restaurant/Food Services Management",
    "SBMO": "Small Business Management/Operations",
    "TTMG": "Travel/Tourism Management",
    "BMQMG": "Business/Management Quantitative Methods, General",
    "ACTS": "Actuarial Science",
    "BME": "Business/Managerial Economics",
    "FNCG": "Finance, General",
    "BFSS": "Banking & Financial Support Services",
    "FPS": "Financial Planning & Services",
    "IRM": "Insurance & Risk Management",
    "INVS": "Investments & Securities",
    "MIS": "Management Information Systems",
    "REE": "Real Estate",
    "SMMG": "Sales, Merchandising, & Marketing, General",
    "FM": "Fashion Merchandising",
    "TTM": "Tourism & Travel Marketing",
    "SSOA": "Secretarial Studies & Office Administration",
    "CMMG": "Communications, General",
    "ADV": "Advertising",
    "DCM": "Digital Communications/Media",
    "JB": "Journalism, Broadcast",
    "JP": "Journalism, Print",
    "MCUMM": "Mass Communications",
    "PROC": "Public Relations & Organizational Communication",
    "RTB": "Radio & Television Broadcasting",
    "CMMTG": "Communications Technology, General",
    "GPEO": "Graphic & Printing Equipment Operation",
    "MASE": "Multimedia/Animation/Special Effects",
    "RTBT": "Radio & Television Broadcasting Technology",
    "FCSG": "Family & Consumer Sciences, General",
    "ADAG": "Adult Development & Aging/Gerontology",
    "CCSM": "Child Care Services Management",
    "CHID": "Child Development",
    "CFE": "Consumer & Family Economics",
    "FN": "Food & Nutrition",
    "TA": "Textile & Apparel",
    "PRLG": "Parks, Recreation, & Leisure, General",
    "ESPK": "Exercise Science/Physiology/Kinesiology",
    "HPEF": "Health & Physical Education/Fitness",
    "PRLFM": "Parks/Rec/Leisure Facilities Management",
    "SFAM": "Sport & Fitness Administration/Management",
    "PESG": "Personal Services, General",
    "COSH": "Cosmetology/Hairstyling",
    "CACT": "Culinary Arts/Chef Training",
    "FSMS": "Funeral Services & Mortuary Science",
    "PRSG": "Protective Services, General",
    "CORR": "Corrections",
    "CRJ": "Criminal Justice",
    "FPST": "Fire Protection & Safety Technology",
    "LENF": "Law Enforcement",
    "MTECH": "Military Technologies",
    "PASG": "Public Administration & Services, General",
    "COA": "Community Organization & Advocacy",
    "PCADM": "Public Administration",
    "PAPPA": "Public Affairs & Public Policy Analysis",
    "SCW": "Social Work",
    "CISG": "Computer & Information Sciences, General",
    "CNT": "Computer Networking/Telecommunications",
    "CSP": "Computer Science & Programming",
    "CSMA": "Computer Software & Media Applications",
    "CSA": "Computer System Administration",
    "DMT": "Data Management Technology",
    "ISC": "Information Science",
    "WD": "Webpage Design",
    "MG": "Mathematics, General",
    "AP": "Applied Mathematics",
    "STAT": "Statistics",
    "CSS": "Counselling & Student Services",
    "EA": "Educational Administration",
    "SPE": "Special Education",
    "TEG": "Teacher Education, General",
    "CIN": "Curriculum & Instruction",
    "EECE": "Early Childhood Education",
    "ELE": "Elementary Education",
    "JHSE": "Junior High/Middle School Education",
    "POSE": "Postsecondary Education",
    "SECE": "Secondary Education",
    "TAAE": "Teacher Assisting/Aide Education",
    "TESS": "Teacher Education, Subject-Specific",
    "ARGE": "Agricultural Education",
    "ARTE": "Art Education",
    "BE": "Business Education",
    "CTE": "Career & Technical Education",
    "ESLE": "English-as-a-Second-Language Education",
    "ELAE": "English/Language Arts Education",
    "FLE": "Foreign Languages Education",
    "HE": "Health Education",
    "MATHE": "Mathematics Education",
    "MUSE": "Music Education",
    "PEC": "Physical Education & Coaching",
    "SCE": "Science Education",
    "SSSE": "Social Studies/Sciences Education",
    "ENG": "Engineering (Pre-Engineering), General",
    "AERENG": "Aerospace/Aeronautical Engineering",
    "ARGBI": "Agricultural/Bioengineering",
    "ARCHE": "Architectural Engineering",
    "BIOE": "Biomedical Engineering",
    "CHEE": "Chemical Engineering",
    "CIE": "Civil Engineering",
    "CMPE": "Computer Engineering",
    "CNSEM": "Construction Engineering/Management",
    "EECE": "Electrical, Electronics & Communications Engineering",
    "EHE": "Environmental Health Engineering",
    "INDE": "Industrial Engineering",
    "MECHE": "Mechanical Engineering",
    "NUCE": "Nuclear Engineering",
    "DTG": "Drafting/CAD Technology, General",
    "ADT": "Architectural Drafting/CAD Technology",
    "MDT": "Mechanical Drafting/CAD Technology",
    "ETG": "Engineering Technology, General",
    "AAET": "Aeronautical/Aerospace Engineering Technologies",
    "ARCHET": "Architectural Engineering Technology",
    "ATET": "Automotive Engineering Technology",
    "CVET": "Civil Engineering Technology",
    "CMPET": "Computer Engineering Technology",
    "CPT": "Construction/Building Technology",
    "EEET": "Electrical, Electronics Engineering Technologies",
    "EBET": "Electromechanical/Biomedical Engineering Technologies",
    "ENVCT": "Environmental Control Technologies",
    "INDPT": "Industrial Production Technologies",
    "MECHET": "Mechanical Engineering Technology",
    "QCST": "Quality Control & Safety Technologies",
    "SURVT": "Surveying Technology",
    "ELLG": "English Language & Literature, General",
    "AEL": "American/English Literature",
    "CRW": "Creative Writing",
    "PBCS": "Public Speaking",
    "FLLG": "Foreign Languages/Literatures, General",
    "ASLL": "Asian Languages & Literatures",
    "CALL": "Classical/Ancient Languages & Literatures",
    "COMPL": "Comparative Literature",
    "FRLL": "French Language & Literature",
    "GELL": "German Language & Literature",
    "LING": "Linguistics",
    "MELL": "Middle Eastern Languages & Literatures",
    "SPLL": "Spanish Language & Literature",
    "HSAG": "Health Services Administration, General",
    "HFA": "Hospital/Facilities Administration",
    "MOS": "Medical Office/Secretarial",
    "MR": "Medical Records",
    "MCAG": "Medical/Clinical Assisting, General",
    "DAS": "Dental Assisting",
    "MAS": "Medical Assisting",
    "OTAS": "Occupational Therapy Assisting",
    "PTAS": "Physical Therapy Assisting",
    "VAST": "Veterinarian Assisting/Technology",
    "CHP": "Chiropractic (Pre-Chiropractic) ",
    "DTH": "Dental Hygiene",
    "PRED": "Dentistry (Pre-Dentistry) ",
    "EMT": "Emergency Medical Technology",
    "HRPSG": "Health-Related Professions & Services, General",
    "ATHT": "Athletic Training",
    "CDSSP": "Communication Disorder Services (e.g., Speech Pathology) ",
    "PBH": "Public Health",
    "HMTG": "Health/Medical Technology, General",
    "MLT": "Medical Laboratory Technology",
    "MRT": "Medical Radiologic Technology",
    "NMT": "Nuclear Medicine Technology",
    "RTT": "Respiratory Therapy Technology",
    "SRGT": "Surgical Technology",
    "PREMD": "Medicine (Pre-Medicine) ",
    "NPV": "Nursing, Practical/Vocational (LPN) ",
    "NR": "Nursing, Registered (BS/RN) ",
    "PREOP": "Optometry (Pre-Optometry) ",
    "OSTM": "Osteopathic Medicine",
    "PREPH": "Pharmacy (Pre-Pharmacy) ",
    "PHYSA": "Physician Assisting",
    "THRG": "Therapy & Rehabilitation, General",
    "ADAC": "Alcohol/Drug Abuse Counselling",
    "MTHR": "Massage Therapy",
    "MHCL": "Mental Health Counselling",
    "OTHR": "Occupational Therapy",
    "PTPPT": "Physical Therapy (Pre-Physical Therapy) ",
    "PMHT": "Psychiatric/Mental Health Technician",
    "RTH": "Rehabilitation Therapy",
    "VRC": "Vocational Rehabilitation Counselling",
    "VM": "Veterinary Medicine (Pre-Veterinarian) ",
    "PHIL": "Philosophy",
    "RLG": "Religion",
    "THEO": "Theology, General",
    "BBS": "Bible/Biblical Studies",
    "DVM": "Divinity/Ministry",
    "RLGE": "Religious Education",
    "AASG": "Aviation & Airway Science, General",
    "APN": "Aircraft Piloting & Navigation",
    "AMO": "Aviation Management & Operations",
    "CTCPE": "Construction Trades (e.g., carpentry, plumbing, electrical)",
    "MRG": "Mechanics & Repairers, General",
    "AMECHT": "Aircraft Mechanics/Technology",
    "AUTRT": "Autobody Repair/Technology",
    "ATMECHT": "Automotive Mechanics/Technology",
    "AVT": "Avionics Technology",
    "DIMT": "Diesel Mechanics/Technology",
    "EEEIR": "Electrical/Electronics Equip Installation & Repair",
    "HARIR": "Heating/Air Cond/Refrig Install/Repair",
    "PPTG": "Precision Production Trades, General",
    "MTTECH": "Machine Tool Technology",
    "WTECH": "Welding Technology",
    "TMM": "Transportation & Materials Moving (e.g., air, ground, & marine)",
    "BIO": "Biology, General",
    "BIOCPH": "Biochemistry & Biophysics",
    "CCBIO": "Cell/Cellular Biology",
    "ECO": "Ecology",
    "GNT": "Genetics",
    "MAB": "Marine/Aquatic Biology",
    "MICRI": "Microbiology & Immunology",
    "ZL": "Zoology",
    "PHSG": "Physical Sciences, General",
    "AST": "Astronomy",
    "ASTSM": "Atmospheric Sciences & Meteorology",
    "CHEM": "Chemistry",
    "GEOES": "Geological & Earth Sciences",
    "PHYS": "Physics",
    "LSG": "Legal Studies, General",
    "COR": "Court Reporting",
    "LAW": "Law (Pre-Law) ",
    "LAAS": "Legal Administrative Assisting/Secretarial",
    "PLA": "Paralegal/Legal Assistant",
    "SSG": "Social Sciences, General",
    "ANTHR": "Anthropology",
    "CRIM": "Criminology",
    "ECON": "Economics",
    "GEOG": "Geography",
    "HIST": "History",
    "IRA": "International Relations & Affairs",
    "PSG": "Political Science & Government",
    "PC": "Psychology, Clinical & Counselling",
    "PSYG": "Psychology, General",
    "SOC": "Sociology",
    "USUA": "Urban Studies/Urban Affairs"
};

function getCSRFToken() {
    return $("meta[name='_csrf']").attr("content");
}

function getCSRFHeader() {
    return $("meta[name='_csrf_header']").attr("content");
}


/**
 *
 * @param btn id, selector or element
 */
function disableButton(btn) {
    $(btn).prop('disabled', true);
}

/**
 *
 * @param btn id, selector or element
 */
function enableButton(btn) {
    $(btn).prop('disabled', false);
}

function universityAutoComplete(inputItem) {
    $(inputItem).autocomplete({
        source: function (request, response) {
            $.ajax({
                url: '/api/universities',
                type: 'GET',
                dataType: 'json',
                data: {name: $(inputItem).val()},
                async: true,
                success: function (data) {
                    var list = new Array();
                    $.each(data, function (i, item) {
                        list.push(item.name);
                    });
                    response(list);
                }, error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error - ajax - universityAutoComplete() - shared.js")
                }
            });
        }
    });
}

/**
 *  Make an ajax request to local-website and get all organization stored in db
 * @param select html select list selector
 */
function ajaxGetAllOrganizations(select) {
    $.ajax({
            method: "get",
            url: "/api/organizations",
            cashe: false,
            processData: false,
            contentType: false,
            beforeSend: function (jqXHR, settings) {
                disableButton(select);
            },
            success: function (data) {
                $.each(data, function (k, v) {
                    $(select).append($('<option>', {value: v.name, text: v.name + " - " + v.location}));
                })
            },
            complete: function (jqXHR, textStatus) {
                enableButton(select);
                $(select).append($('<option>', {value: "other", text: "other"}));
            }
        }
    );

}

/**
 * select all select-list that has data-org=true and fill it with data
 * in general only one list in page
 */
function fillOrganizationList() {
    $("select").each(function () {
        var isOrgList = $(this).data("organization");
        if (isOrgList == null || isOrgList == undefined || isOrgList == false) {
            return;
        }
        var select = $(this);
        ajaxGetAllOrganizations(select)
    });
}


/**
 * For the filed that represent country, it has data-country contains country id, take it an set text to element with country id
 */
function setCountryNameInstadeOfId() {
    $("*[data-country]").each(function () {

        var id = $(this).data("country");
        $(this).text(countryMap[id]);
    })
}


/**
 * For the filed that represent major, it has data-major contains major id, take it an set text to element with major id
 */
function setMajorNameInstadeOfId() {
    $("*[data-major]").each(function () {

        var id = $(this).data("major");
        $(this).text(majorsMap[id]);
    })
}


/**
 * if the selected value come from backend, so data-selected contain the value, and this function set it to selcte-list
 */
function setSelectedOption() {
    $("select").each(function () {
        var selected = $(this).data("selected")
        if (selected != "" && selected != undefined) {
            $(this).val(selected + "").change();
        }
    });
}

$(document).ready(function () {

    //fill all ogranization-select-list with stored orgs
    fillOrganizationList();

    // set country name to element
    setCountryNameInstadeOfId();

    // set major name to element
    setMajorNameInstadeOfId();

    // set selected option for select list
    setSelectedOption();


});