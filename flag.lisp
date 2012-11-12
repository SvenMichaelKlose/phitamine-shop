;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *flags*
  '("Afghanistan" "Albania" "Algeria" "American_Samoa" "Andorra" "Angola" "Anguilla" "Antigua_and_Barbuda" "Argentina" "Armenia" "Aruba" "Australia" "Austria" "Azerbaijan"
    "Bahamas" "Bahrain" "Bangladesh" "Barbados" "Belarus" "Belgium" "Belize" "Benin" "Bermuda" "Bhutan" "Bolivia" "Bosnia" "Botswana" "Brazil" "British_Virgin_Islands" "Brunei" "Bulgaria" "Burkina_Faso" "Burundi"
    "Cambodia" "Cameroon" "Canada" "Cape_Verde" "Cayman_Islands" "Central_African_Republic" "Chad" "Chile" "China" "Christmas_Island" "Colombia" "Comoros" "Cook_Islands" "Costa_Rica" "Côte_d\"Ivoire" "Croatia" "Cuba" "Cyprus" "Czech_Republic"
    "Democratic_Republic_of_the_Congo" "Denmark" "Djibouti" "Dominican_Republic" "Dominica"
    "Ecuador" "Egypt" "El_Salvador" "Equatorial_Guinea" "Eritrea" "Estonia" "Ethiopia"
    "Falkland_Islands" "Faroe_Islands" "Fiji" "Finland" "France" "French_Polynesia"
    "Gabon" "Gambia" "Georgia" "Germany" "Ghana" "Gibraltar" "Greece" "Greenland" "Grenada" "Guam" "Guatemala" "Guinea_Bissau" "Guinea" "Guyana"
    "Haiti" "Honduras" "Hong_Kong" "Hungary"
    "Iceland" "India" "Indonesia" "Iran" "Iraq" "Ireland" "Israel" "Italy"
    "Jamaica" "Japan" "Jordan"
    "Kazakhstan" "Kenya" "Kiribati" "Kuwait" "Kyrgyzstan"
    "Laos" "Latvia" "Lebanon" "Lesotho" "Liberia" "Libya" "Liechtenstein" "Lithuania" "Luxembourg"
    "Macao" "Macedonia" "Madagascar" "Malawi" "Malaysia" "Maldives" "Mali" "Malta" "Marshall_Islands" "Martinique" "Mauritania" "Mauritius" "Mexico" "Micronesia" "Moldova" "Monaco" "Mongolia" "Montserrat" "Morocco" "Mozambique" "Myanmar"
    "Namibia" "Nauru" "Nepal" "Netherlands_Antilles" "Netherlands" "New_Zealand" "Nicaragua" "Nigeria" "Niger" "Niue" "Norfolk_Island" "North_Korea" "Norway"
    "Oman"
    "Pakistan" "Palau" "Panama" "Papua_New_Guinea" "Paraguay" "Peru" "Philippines" "Pitcairn_Islands" "Poland" "Portugal" "Puerto_Rico"
    "Qatar"
    "Republic_of_the_Congo" "Romania" "Russian_Federation" "Rwanda"
    "Saint_Kitts_and_Nevis" "Saint_Lucia" "Saint_Pierre" "Saint_Vicent_and_the_Grenadines" "Samoa" "San_Marino" "Sao_Tomé_and_Príncipe" "Saudi_Arabia" "Senegal" "Serbia_and_Montenegro" "Seychelles" "Sierra_Leone" "Singapore" "Slovakia" "Slovenia" "Soloman_Islands" "Somalia" "South_Africa" "South_Georgia" "South_Korea" "Soviet_Union" "Spain" "Sri_Lanka" "Sudan" "Suriname" "Swaziland" "Sweden" "Switzerland" "Syria"
    "Taiwan" "Tajikistan" "Tanzania" "Thailand" "Tibet" "Timor-Leste" "Togo" "Tonga" "Trinidad_and_Tobago" "Tunisia" "Turkey" "Turkmenistan" "Turks_and_Caicos_Islands" "Tuvalu"
    "UAE" "Uganda" "Ukraine" "United_Kingdom" "United_States_of_America" "Uruguay" "US_Virgin_Islands" "Uzbekistan"
    "Vanuatu" "Vatican_City" "Venezuela" "Vietnam"
    "Wallis_and_Futuna"
    "Yemen"
    "Zambia" "Zimbabwe"))

(defvar *flags2* nil)

(defun flag-options (selected)
  (unless *flags2*
    (= *flags2* (filter [cons _ _] *flags*)))
  (lhtml-options *flags2* selected))

(defun flag-src (name)
  (+ *base-url* "/media/flags/" name ".png"))

(defun flag-name? (name)
  (member name *flags* :test #'eq))
