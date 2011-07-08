#!/usr/bin/perl -w

use Test::More tests => 297;

use Number::Phone::Country;

# NANP formats
ok(phone2country(  "219-555-0199") eq "US",   "NANP: xxx-xxx-xxxx format");
ok(phone2country("(219) 555-0199") eq "US",   "NANP: (xxx) xxx-xxxx format");
ok(phone2country("1 219 555 0199") eq "US",   "NANP: 1 xxx xxx xxxx format");
ok(phone2country("1-219-555-0199") eq "US",   "NANP: 1-xxx-xxx-xxxx format");
ok(phone2country("1 219-555-0199") eq "US",   "NANP: 1 xxx-xxx-xxxx format");
ok(phone2country(  "+12195550199") eq "US",   "NANP: +1xxxxxxxxxx format");

ok(phone2country("1 800 555 0199") eq "NANP", "NANP: toll-free number IDed as generic NANP number");

# NANP
# FIXME make sure a decent number of CA and US codes are covered!
ok(phone2country("1 226 555 0199") eq "CA", "NANP: CA: 226");
ok(phone2country("1 438 555 0199") eq "CA", "NANP: CA: 438");
ok(phone2country("1 601 555 0199") eq "US", "NANP: US: 601");
ok(phone2country("1 706 555 0199") eq "US", "NANP: US: 706");

# NANP little countries, in area code order
ok(phone2country('1 242 555 0199') eq 'BS', 'NANP: BS: 242');
ok(phone2country('1 246 555 0199') eq 'BB', 'NANP: BB: 246');
ok(phone2country('1 264 555 0199') eq 'AI', 'NANP: AI: 264');
ok(phone2country('1 268 555 0199') eq 'AG', 'NANP: AG: 268');
ok(phone2country('1 284 555 0199') eq 'VG', 'NANP: VG: 284');
ok(phone2country('1 340 555 0199') eq 'VI', 'NANP: VI: 340');
ok(phone2country('1 345 555 0199') eq 'KY', 'NANP: KY: 345');
ok(phone2country('1 441 555 0199') eq 'BM', 'NANP: BM: 441');
ok(phone2country('1 473 555 0199') eq 'GD', 'NANP: GD: 473');
ok(phone2country('1 649 555 0199') eq 'TC', 'NANP: TC: 649');
ok(phone2country('1 664 555 0199') eq 'MS', 'NANP: MS: 664');
ok(phone2country('1 670 555 0199') eq 'MP', 'NANP: MP: 670');
ok(phone2country('1 671 555 0199') eq 'GU', 'NANP: GU: 671');
ok(phone2country('1 684 555 0199') eq 'AS', 'NANP: AS: 684');
ok(phone2country('1 758 555 0199') eq 'LC', 'NANP: LC: 758');
ok(phone2country('1 767 555 0199') eq 'DM', 'NANP: DM: 767');
ok(phone2country('1 784 555 0199') eq 'VC', 'NANP: VC: 784');
ok(phone2country('1 787 555 0199') eq 'PR', 'NANP: PR: 787');
ok(phone2country('1 809 555 0199') eq 'DO', 'NANP: DO: 809');
ok(phone2country('1 829 555 0199') eq 'DO', 'NANP: DO: 829');
ok(phone2country('1 849 555 0199') eq 'DO', 'NANP: DO: 849');
ok(phone2country('1 868 555 0199') eq 'TT', 'NANP: TT: 868');
ok(phone2country('1 869 555 0199') eq 'KN', 'NANP: KN: 869');
ok(phone2country('1 876 555 0199') eq 'JM', 'NANP: JM: 876');
ok(phone2country('1 939 555 0199') eq 'PR', 'NANP: PR: 939');

# Sometimes countries move around. Pesky things.
{ no warnings;
ok(phone2country('+6841234567') ne 'AS', "+684 *not* identified as AS"); 
}

# FIXME - add Kazakhstan/Russia weirdness

print "# test some stupid formatting\n";
ok(phone2country('+441234567890') eq 'GB',      '+441234567890 is GB');
ok(phone2country('+44 1234 567890') eq 'GB',    '+44 1234 567890 is GB');
ok(phone2country('+44 1234-567890') eq 'GB',    '+44 1234-567890 is GB');
ok(phone2country('+44 (0)1234 567890') eq 'GB', '+44 (0)1234 567890 is GB');
ok(phone2country('+4-4 845 00 DEVIL') eq 'GB',  '+4-4 845 00 DEVIL is GB');

print "# regression tests for all other country codes start here\n";
ok(phone2country('+20123')  eq 'EG', '+20 is EG');
ok(phone2country('+212123') eq 'MA', '+212 is MA');
ok(phone2country('+2125288123') eq 'EH', '+212 5288 is EH');
ok(phone2country('+2125289123') eq 'EH', '+212 5289 is EH');
ok(phone2country('+213123') eq 'DZ', '+213 is DZ');
ok(phone2country('+216123') eq 'TN', '+216 is TN');
ok(phone2country('+218123') eq 'LY', '+218 is LY');
ok(phone2country('+220123') eq 'GM', '+220 is GM');
ok(phone2country('+221123') eq 'SN', '+221 is SN');
ok(phone2country('+222123') eq 'MR', '+222 is MR');
ok(phone2country('+223123') eq 'ML', '+223 is ML');
ok(phone2country('+224123') eq 'GN', '+224 is GN');
ok(phone2country('+225123') eq 'CI', '+225 is CI');
ok(phone2country('+226123') eq 'BF', '+226 is BF');
ok(phone2country('+227123') eq 'NE', '+227 is NE');
ok(phone2country('+228123') eq 'TG', '+228 is TG');
ok(phone2country('+229123') eq 'BJ', '+229 is BJ');
ok(phone2country('+230123') eq 'MU', '+230 is MU');
ok(phone2country('+231123') eq 'LR', '+231 is LR');
ok(phone2country('+232123') eq 'SL', '+232 is SL');
ok(phone2country('+233123') eq 'GH', '+233 is GH');
ok(phone2country('+234123') eq 'NG', '+234 is NG');
ok(phone2country('+235123') eq 'TD', '+235 is TD');
ok(phone2country('+236123') eq 'CF', '+236 is CF');
ok(phone2country('+237123') eq 'CM', '+237 is CM');
ok(phone2country('+238123') eq 'CV', '+238 is CV');
ok(phone2country('+239123') eq 'ST', '+239 is ST');
ok(phone2country('+240123') eq 'GQ', '+240 is GQ');
ok(phone2country('+241123') eq 'GA', '+241 is GA');
ok(phone2country('+242123') eq 'CG', '+242 is CG');
ok(phone2country('+243123') eq 'CD', '+243 is CD');
ok(phone2country('+244123') eq 'AO', '+244 is AO');
ok(phone2country('+245123') eq 'GW', '+245 is GW');
ok(phone2country('+246123') eq 'IO', '+246 is IO');
ok(phone2country('+247123') eq 'AC', '+247 is AC');
ok(phone2country('+248123') eq 'SC', '+248 is SC');
ok(phone2country('+249123') eq 'SD', '+249 is SD');
ok(phone2country('+250123') eq 'RW', '+250 is RW');
ok(phone2country('+251123') eq 'ET', '+251 is ET');
ok(phone2country('+252123') eq 'SO', '+252 is SO');
ok(phone2country('+253123') eq 'DJ', '+253 is DJ');
ok(phone2country('+254123') eq 'KE', '+254 is KE');
ok(phone2country('+255123') eq 'TZ', '+255 is TZ');
ok(phone2country('+256123') eq 'UG', '+256 is UG');
ok(phone2country('+257123') eq 'BI', '+257 is BI');
ok(phone2country('+258123') eq 'MZ', '+258 is MZ');
ok(phone2country('+260123') eq 'ZM', '+260 is ZM');
ok(phone2country('+261123') eq 'MG', '+261 is MG');
ok(phone2country('+262123') eq 'RE', '+262 is RE');
ok(phone2country('+2622691123')  eq 'YT', '+2622691 is YT');
ok(phone2country('+26226960123') eq 'YT', '+26226960 is YT');
ok(phone2country('+26226961123') eq 'YT', '+26226961 is YT');
ok(phone2country('+26226962123') eq 'YT', '+26226962 is YT');
ok(phone2country('+26226963123') eq 'YT', '+26226963 is YT');
ok(phone2country('+26226964123') eq 'YT', '+26226964 is YT');
ok(phone2country('+26263920123') eq 'YT', '+26263920 is YT');
ok(phone2country('+26263921123') eq 'YT', '+26263921 is YT');
ok(phone2country('+26263922123') eq 'YT', '+26263922 is YT');
ok(phone2country('+26263923123') eq 'YT', '+26263923 is YT');
ok(phone2country('+26263924123') eq 'YT', '+26263924 is YT');
ok(phone2country('+26263965123') eq 'YT', '+26263965 is YT');
ok(phone2country('+26263966123') eq 'YT', '+26263966 is YT');
ok(phone2country('+26263967123') eq 'YT', '+26263967 is YT');
ok(phone2country('+26263968123') eq 'YT', '+26263968 is YT');
ok(phone2country('+26263969123') eq 'YT', '+26263969 is YT');
ok(phone2country('+263123') eq 'ZW', '+263 is ZW');
ok(phone2country('+264123') eq 'NA', '+264 is NA');
ok(phone2country('+265123') eq 'MW', '+265 is MW');
ok(phone2country('+266123') eq 'LS', '+266 is LS');
ok(phone2country('+267123') eq 'BW', '+267 is BW');
ok(phone2country('+268123') eq 'SZ', '+268 is SZ');
ok(phone2country('+269123') eq 'KM', '+269 is KM');
ok(phone2country('+27123')  eq 'ZA', '+27 is ZA');
ok(phone2country('+290123') eq 'SH', '+290 is SH');
ok(phone2country('+291123') eq 'ER', '+291 is ER');
ok(phone2country('+297123') eq 'AW', '+297 is AW');
ok(phone2country('+298123') eq 'FO', '+298 is FO');
ok(phone2country('+299123') eq 'GL', '+299 is GL');
ok(phone2country('+30123')  eq 'GR', '+30 is GR');
ok(phone2country('+31123')  eq 'NL', '+31 is NL');
ok(phone2country('+32123')  eq 'BE', '+32 is BE');
ok(phone2country('+33123')  eq 'FR', '+33 is FR');
ok(phone2country('+34123')  eq 'ES', '+34 is ES');
ok(phone2country('+350123') eq 'GI', '+350 is GI');
ok(phone2country('+351123') eq 'PT', '+351 is PT');
ok(phone2country('+352123') eq 'LU', '+352 is LU');
ok(phone2country('+353123') eq 'IE', '+353 is IE');
ok(phone2country('+35348123') eq 'GB', '+35348 is GB'); # Northern Ireland, as part of Ireland
ok(phone2country('+354123') eq 'IS', '+354 is IS');
ok(phone2country('+355123') eq 'AL', '+355 is AL');
ok(phone2country('+356123') eq 'MT', '+356 is MT');
ok(phone2country('+357123') eq 'CY', '+357 is CY');
ok(phone2country('+358123') eq 'FI', '+358 is FI');
ok(phone2country('+359123') eq 'BG', '+359 is BG');
ok(phone2country('+36123')  eq 'HU', '+36 is HU');
ok(phone2country('+370123') eq 'LT', '+370 is LT');
ok(phone2country('+371123') eq 'LV', '+371 is LV');
ok(phone2country('+372123') eq 'EE', '+372 is EE');
ok(phone2country('+373123') eq 'MD', '+373 is MD');
ok(phone2country('+374123') eq 'AM', '+374 is AM');
ok(phone2country('+375123') eq 'BY', '+375 is BY');
ok(phone2country('+376123') eq 'AD', '+376 is AD');
ok(phone2country('+377123') eq 'MC', '+377 is MC');
ok(phone2country('+37744123') eq 'KOS', '+377 44 is KOS');
ok(phone2country('+37745123') eq 'KOS', '+377 45 is KOS');
ok(phone2country('+378123') eq 'SM', '+378 is SM');
ok(phone2country('+379123') eq 'VA', '+379 is VA');
ok(phone2country('+380123') eq 'UA', '+380 is UA');
ok(phone2country('+381123') eq 'RS', '+381 is RS');
ok(phone2country('+38128123') eq 'KOS', '+381 28 is KOS');
ok(phone2country('+38129123') eq 'KOS', '+381 29 is KOS');
ok(phone2country('+38138123') eq 'KOS', '+381 38 is KOS');
ok(phone2country('+38139123') eq 'KOS', '+381 39 is KOS');
ok(phone2country('+382123') eq 'ME', '+382 is ME');
ok(phone2country('+385123') eq 'HR', '+385 is HR');
ok(phone2country('+386123') eq 'SI', '+386 is SI');
ok(phone2country('+38643123') eq 'KOS', '+386 43 is KOS');
ok(phone2country('+38649123') eq 'KOS', '+386 44 is KOS');
ok(phone2country('+387123') eq 'BA', '+387 is BA');
ok(phone2country('+389123') eq 'MK', '+389 is MK');
ok(phone2country('+39123')  eq 'IT', '+39 is IT');
ok(phone2country('+3966982123') eq 'VA', '+3966982 is VA'); # Vatican, as part of Rome
ok(phone2country('+40123')  eq 'RO', '+40 is RO');
ok(phone2country('+41123')  eq 'CH', '+41 is CH');
ok(phone2country('+420123') eq 'CZ', '+420 is CZ');
ok(phone2country('+421123') eq 'SK', '+421 is SK');
ok(phone2country('+423123') eq 'LI', '+423 is LI');
ok(phone2country('+43123')  eq 'AT', '+43 is AT');
ok(phone2country('+44123')  eq 'GB', '+44 is GB');
ok(phone2country('+45123')  eq 'DK', '+45 is DK');
ok(phone2country('+46123')  eq 'SE', '+46 is SE');
ok(phone2country('+47123')  eq 'NO', '+47 is NO');
ok(phone2country('+48123')  eq 'PL', '+48 is PL');
ok(phone2country('+49123')  eq 'DE', '+49 is DE');
ok(phone2country('+500123') eq 'FK', '+500 is FK');
ok(phone2country('+501123') eq 'BZ', '+501 is BZ');
ok(phone2country('+502123') eq 'GT', '+502 is GT');
ok(phone2country('+503123') eq 'SV', '+503 is SV');
ok(phone2country('+504123') eq 'HN', '+504 is HN');
ok(phone2country('+505123') eq 'NI', '+505 is NI');
ok(phone2country('+506123') eq 'CR', '+506 is CR');
ok(phone2country('+507123') eq 'PA', '+507 is PA');
ok(phone2country('+508123') eq 'PM', '+508 is PM');
ok(phone2country('+509123') eq 'HT', '+509 is HT');
ok(phone2country('+51123')  eq 'PE', '+51 is PE');
ok(phone2country('+52123')  eq 'MX', '+52 is MX');
ok(phone2country('+53123')  eq 'CU', '+53 is CU');
ok(phone2country('+54123')  eq 'AR', '+54 is AR');
ok(phone2country('+55123')  eq 'BR', '+55 is BR');
ok(phone2country('+56123')  eq 'CL', '+56 is CL');
ok(phone2country('+57123')  eq 'CO', '+57 is CO');
ok(phone2country('+58123')  eq 'VE', '+58 is VE');
ok(phone2country('+590123') eq 'GP', '+590 is GP');
ok(phone2country('+591123') eq 'BO', '+591 is BO');
ok(phone2country('+592123') eq 'GY', '+592 is GY');
ok(phone2country('+593123') eq 'EC', '+593 is EC');
ok(phone2country('+594123') eq 'GF', '+594 is GF');
ok(phone2country('+595123') eq 'PY', '+595 is PY');
ok(phone2country('+596123') eq 'MQ', '+596 is MQ');
ok(phone2country('+597123') eq 'SR', '+597 is SR');
ok(phone2country('+598123') eq 'UY', '+598 is UY');
ok(phone2country('+599123') eq 'AN', '+599 is AN');
ok(phone2country('+60123')  eq 'MY', '+60 is MY');
ok(phone2country('+61123')  eq 'AU', '+61 is AU');
ok(phone2country('+6189162123') eq 'CC', '+6189162 is CC');
ok(phone2country('+6189164123') eq 'CX', '+6189164 is CX');
ok(phone2country('+62123')  eq 'ID', '+62 is ID');
ok(phone2country('+63123')  eq 'PH', '+63 is PH');
ok(phone2country('+64123')  eq 'NZ', '+64 is NZ');
ok(phone2country('+65123')  eq 'SG', '+65 is SG');
ok(phone2country('+66123')  eq 'TH', '+66 is TH');
ok(phone2country('+670123') eq 'TL', '+670 is TL');
ok(phone2country('+67210123') eq 'AQ', '+67210 is AQ');
ok(phone2country('+67211123') eq 'AQ', '+67211 is AQ');
ok(phone2country('+67212123') eq 'AQ', '+67212 is AQ');
ok(phone2country('+67213123') eq 'AQ', '+67213 is AQ');
ok(phone2country('+6723123') eq 'NF', '+6723 is NF');
ok(phone2country('+673123') eq 'BN', '+673 is BN');
ok(phone2country('+674123') eq 'NR', '+674 is NR');
ok(phone2country('+675123') eq 'PG', '+675 is PG');
ok(phone2country('+676123') eq 'TO', '+676 is TO');
ok(phone2country('+677123') eq 'SB', '+677 is SB');
ok(phone2country('+678123') eq 'VU', '+678 is VU');
ok(phone2country('+679123') eq 'FJ', '+679 is FJ');
ok(phone2country('+680123') eq 'PW', '+680 is PW');
ok(phone2country('+681123') eq 'WF', '+681 is WF');
ok(phone2country('+682123') eq 'CK', '+682 is CK');
ok(phone2country('+683123') eq 'NU', '+683 is NU');
ok(phone2country('+685123') eq 'WS', '+685 is WS');
ok(phone2country('+686123') eq 'KI', '+686 is KI');
ok(phone2country('+687123') eq 'NC', '+687 is NC');
ok(phone2country('+688123') eq 'TV', '+688 is TV');
ok(phone2country('+689123') eq 'PF', '+689 is PF');
ok(phone2country('+690123') eq 'TK', '+690 is TK');
ok(phone2country('+691123') eq 'FM', '+691 is FM');
ok(phone2country('+692123') eq 'MH', '+692 is MH');
ok(phone2country('+7123') eq 'RU', '+7 is RU');
ok(phone2country('+76123') eq 'KZ', '+76 is KZ');
ok(phone2country('+77123') eq 'KZ', '+77 is KZ');
ok(phone2country('+800123') eq 'InternationalFreephone', '+800 is InternationalFreephone');
ok(phone2country('+808123') eq 'SharedCostServices', '+808 is SharedCostServices');
ok(phone2country('+81123')  eq 'JP', '+81 is JP');
ok(phone2country('+82123')  eq 'KR', '+82 is KR');
ok(phone2country('+84123')  eq 'VN', '+84 is VN');
ok(phone2country('+850123') eq 'KP', '+850 is KP');
ok(phone2country('+852123') eq 'HK', '+852 is HK');
ok(phone2country('+853123') eq 'MO', '+853 is MO');
ok(phone2country('+855123') eq 'KH', '+855 is KH');
ok(phone2country('+856123') eq 'LA', '+856 is LA');
ok(phone2country('+86123')  eq 'CN', '+86 is CN');
ok(phone2country('+870123') eq 'Inmarsat', '+870 is Inmarsat');
ok(phone2country('+871123') eq 'Inmarsat', '+871 is Inmarsat');
ok(phone2country('+872123') eq 'Inmarsat', '+872 is Inmarsat');
ok(phone2country('+873123') eq 'Inmarsat', '+873 is Inmarsat');
ok(phone2country('+874123') eq 'Inmarsat', '+874 is Inmarsat');
ok(phone2country('+878123') eq 'UniversalPersonalTelecoms', '+878 is UniversalPersonalTelecoms');
ok(phone2country('+880123') eq 'BD', '+880 is BD');
ok(phone2country('+8816123') eq 'Iridium', '+8816 is Iridium');
ok(phone2country('+8817123') eq 'Iridium', '+8817 is Iridium');
ok(phone2country('+8818123') eq 'Globalstar', '+8818 is Globalstar');
ok(phone2country('+8819123') eq 'Globalstar', '+8819 is Globalstar');
ok(phone2country('+882123') eq 'InternationalNetworks', '+882 is InternationalNetworks');
ok(phone2country('+886123') eq 'TW', '+886 is TW');
ok(phone2country('+90123') eq 'TR', '+90 is TR');
ok(phone2country('+91123') eq 'IN', '+91 is IN');
ok(phone2country('+92123') eq 'PK', '+92 is PK');
ok(phone2country('+93123') eq 'AF', '+93 is AF');
ok(phone2country('+94123') eq 'LK', '+94 is LK');
ok(phone2country('+95123') eq 'MM', '+95 is MM');
ok(phone2country('+960123') eq 'MV', '+960 is MV');
ok(phone2country('+961123') eq 'LB', '+961 is LB');
ok(phone2country('+962123') eq 'JO', '+962 is JO');
ok(phone2country('+963123') eq 'SY', '+963 is SY');
ok(phone2country('+964123') eq 'IQ', '+964 is IQ');
ok(phone2country('+965123') eq 'KW', '+965 is KW');
ok(phone2country('+966123') eq 'SA', '+966 is SA');
ok(phone2country('+967123') eq 'YE', '+967 is YE');
ok(phone2country('+968123') eq 'OM', '+968 is OM');
ok(phone2country('+970123') eq 'PS', '+970 is PS');
ok(phone2country('+971123') eq 'AE', '+971 is AE');
ok(phone2country('+972123') eq 'IL', '+972 is IL');
ok(phone2country('+973123') eq 'BH', '+973 is BH');
ok(phone2country('+974123') eq 'QA', '+974 is QA');
ok(phone2country('+975123') eq 'BT', '+975 is BT');
ok(phone2country('+976123') eq 'MN', '+976 is MN');
ok(phone2country('+977123') eq 'NP', '+977 is NP');
ok(phone2country('+979123') eq 'InternationalPremiumRate', '+979 is InternationalPremiumRate');
ok(phone2country('+98123') eq 'IR', '+98 is IR');
ok(phone2country('+991123') eq 'ITPCS', '+991 is ITPCS');
ok(phone2country('+992123') eq 'TJ', '+992 is TJ');
ok(phone2country('+993123') eq 'TM', '+993 is TM');
ok(phone2country('+994123') eq 'AZ', '+994 is AZ');
ok(phone2country('+995123') eq 'GE', '+995 is GE');
ok(phone2country('+996123') eq 'KG', '+996 is KG');
ok(phone2country('+998123') eq 'UZ', '+998 is UZ');
