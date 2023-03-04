import 'package:scrubbers_employee_application/common/StringUtils.dart';

final allBreeds = [
  "AFFENPINSCHER",
  "AFGHAN HOUND",
  "AIREDALE TERRIER",
  "AKITA",
  "ALASKAN MALAMUTE",
  "ALPINE DACHSBRACKE",
  "AMERICAN AKITA",
  "AMERICAN COCKER SPANIEL",
  "AMERICAN FOXHOUND",
  "AMERICAN STAFFORDSHIRE TERRIER",
  "AMERICAN WATER SPANIEL",
  "APPENZELL CATTLE DOG",
  "ARIEGE POINTING DOG",
  "ARIEGEOIS",
  "ARTOIS HOUND",
  "ATLAS MOUNTAIN DOG (AIDI)",
  "AUSTRALIAN CATTLE DOG",
  "AUSTRALIAN KELPIE",
  "AUSTRALIAN SHEPHERD",
  "AUSTRALIAN SILKY TERRIER",
  "AUSTRALIAN STUMPY TAIL CATTLE DOG",
  "AUSTRALIAN TERRIER",
  "AUSTRIAN  PINSCHER",
  "AUSTRIAN BLACK AND TAN HOUND",
  "AUVERGNE POINTER",
  "AZAWAKH",
  "BASENJI",
  "BASSET FAUVE DE BRETAGNE",
  "BASSET HOUND",
  "BAVARIAN MOUNTAIN SCENT HOUND",
  "BEAGLE",
  "BEAGLE HARRIER",
  "BEARDED COLLIE",
  "BEDLINGTON TERRIER",
  "BELGIAN SHEPHERD DOG",
  "BERGAMASCO SHEPHERD DOG",
  "BERGER DE BEAUCE",
  "BERNESE MOUNTAIN DOG",
  "BICHON FRISE",
  "BILLY",
  "BLACK AND TAN COONHOUND",
  "BLOODHOUND",
  "BLUE GASCONY BASSET",
  "BLUE GASCONY GRIFFON",
  "BLUE PICARDY SPANIEL",
  "BOHEMIAN SHEPHERD DOG",
  "BOHEMIAN WIRE-HAIRED POINTING GRIFFON",
  "BOLOGNESE",
  "BORDER COLLIE",
  "BORDER TERRIER",
  "BORZOI - RUSSIAN HUNTING SIGHTHOUND",
  "BOSNIAN AND HERZEGOVINIAN - CROATIAN SHEPHERD DOG",
  "BOSNIAN BROKEN-HAIRED HOUND - CALLED BARAK",
  "BOSTON TERRIER",
  "BOURBONNAIS POINTING DOG",
  "BOUVIER DES ARDENNES",
  "BOUVIER DES FLANDRES",
  "BOXER",
  "BRAZILIAN TERRIER",
  "BRAZILIAN TRACKER",
  "BRIARD",
  "BRIQUET GRIFFON VENDEEN",
  "BRITTANY SPANIEL",
  "BROHOLMER",
  "BULL TERRIER",
  "BULLDOG",
  "BULLMASTIFF",
  "BURGOS POINTING DOG",
  "CAIRN TERRIER",
  "CANAAN DOG",
  "CANADIAN ESKIMO DOG",
  "CANARIAN WARREN HOUND",
  "CASTRO LABOREIRO DOG",
  "CATALAN SHEEPDOG",
  "CAUCASIAN SHEPHERD DOG",
  "CAVALIER KING CHARLES SPANIEL",
  "CENTRAL ASIA SHEPHERD DOG",
  "CESKY TERRIER",
  "CHESAPEAKE BAY RETRIEVER",
  "CHIHUAHUA",
  "CHINESE CRESTED DOG",
  "CHOW CHOW",
  "CIMARR\u00d3N URUGUAYO",
  "CIRNECO DELL'ETNA",
  "CLUMBER SPANIEL",
  "COARSE-HAIRED STYRIAN HOUND",
  "COLLIE ROUGH",
  "COLLIE SMOOTH",
  "CONTINENTAL BULLDOG",
  "CONTINENTAL TOY SPANIEL",
  "COTON DE TULEAR",
  "CROATIAN SHEPHERD DOG",
  "CURLY COATED RETRIEVER",
  "CZECHOSLOVAKIAN WOLFDOG",
  "DACHSHUND",
  "DALMATIAN",
  "DANDIE DINMONT TERRIER",
  "DANISH-SWEDISH FARMDOG",
  "DEERHOUND",
  "DEUTSCH LANGHAAR",
  "DEUTSCH STICHELHAAR",
  "DOBERMANN",
  "DOGO ARGENTINO",
  "DOGUE DE BORDEAUX",
  "DRENTSCHE PARTRIDGE DOG",
  "DREVER",
  "DUTCH SCHAPENDOES",
  "DUTCH SHEPHERD DOG",
  "DUTCH SMOUSHOND",
  "EAST SIBERIAN LAIKA",
  "ENGLISH COCKER SPANIEL",
  "ENGLISH FOXHOUND",
  "ENGLISH POINTER",
  "ENGLISH SETTER",
  "ENGLISH SPRINGER SPANIEL",
  "ENGLISH TOY TERRIER (BLACK &TAN)",
  "ENTLEBUCH CATTLE DOG",
  "ESTONIAN HOUND",
  "ESTRELA MOUNTAIN DOG",
  "EURASIAN",
  "FAWN BRITTANY GRIFFON",
  "FIELD SPANIEL",
  "FILA BRASILEIRO",
  "FINNISH HOUND",
  "FINNISH LAPPONIAN DOG",
  "FINNISH SPITZ",
  "FLAT COATED RETRIEVER",
  "FOX TERRIER (SMOOTH)",
  "FOX TERRIER (WIRE)",
  "FRENCH BULLDOG",
  "FRENCH POINTING DOG - GASCOGNE TYPE",
  "FRENCH POINTING DOG - PYRENEAN TYPE",
  "FRENCH SPANIEL",
  "FRENCH TRICOLOUR HOUND",
  "FRENCH WATER DOG",
  "FRENCH WHITE & BLACK HOUND",
  "FRENCH WHITE AND ORANGE HOUND",
  "FRISIAN WATER DOG",
  "GASCON SAINTONGEOIS",
  "GERMAN HOUND",
  "GERMAN HUNTING TERRIER",
  "GERMAN PINSCHER",
  "GERMAN SHEPHERD DOG",
  "GERMAN SHORT- HAIRED POINTING DOG",
  "GERMAN SPANIEL",
  "GERMAN SPITZ",
  "GERMAN WIRE- HAIRED POINTING DOG",
  "GIANT SCHNAUZER",
  "GOLDEN RETRIEVER",
  "GORDON SETTER",
  "GRAND BASSET GRIFFON VENDEEN",
  "GRAND GRIFFON VENDEEN",
  "GREAT ANGLO-FRENCH TRICOLOUR HOUND",
  "GREAT ANGLO-FRENCH WHITE & ORANGE HOUND",
  "GREAT ANGLO-FRENCH WHITE AND BLACK HOUND",
  "GREAT DANE",
  "GREAT GASCONY BLUE",
  "GREAT SWISS MOUNTAIN DOG",
  "GREENLAND DOG",
  "GREYHOUND",
  "GRIFFON BELGE",
  "GRIFFON BRUXELLOIS",
  "GRIFFON NIVERNAIS",
  "HALDEN HOUND",
  "HAMILTONST\u00d6VARE",
  "HANOVERIAN SCENT HOUND",
  "HARRIER",
  "HAVANESE",
  "HELLENIC HOUND",
  "HOKKAIDO",
  "HOVAWART",
  "HUNGARIAN GREYHOUND",
  "HUNGARIAN HOUND - TRANSYLVANIAN SCENT HOUND",
  "HUNGARIAN SHORT-HAIRED POINTER (VIZSLA)",
  "HUNGARIAN WIRE-HAIRED POINTER",
  "HYGEN HOUND",
  "IBIZAN PODENCO",
  "ICELANDIC SHEEPDOG",
  "IRISH GLEN OF IMAAL TERRIER",
  "IRISH RED AND WHITE SETTER",
  "IRISH RED SETTER",
  "IRISH SOFT COATED WHEATEN TERRIER",
  "IRISH TERRIER",
  "IRISH WATER SPANIEL",
  "IRISH WOLFHOUND",
  "ISTRIAN SHORT-HAIRED HOUND",
  "ISTRIAN WIRE-HAIRED HOUND",
  "ITALIAN CANE CORSO",
  "ITALIAN POINTING DOG",
  "ITALIAN ROUGH-HAIRED SEGUGIO",
  "ITALIAN SHORT-HAIRED SEGUGIO",
  "ITALIAN SIGHTHOUND",
  "ITALIAN SPINONE",
  "ITALIAN VOLPINO",
  "JACK RUSSELL TERRIER",
  "JAPANESE CHIN",
  "JAPANESE SPITZ",
  "JAPANESE TERRIER",
  "J\u00c4MTHUND",
  "KAI",
  "KANGAL SHEPHERD DOG",
  "KARELIAN BEAR DOG",
  "KARST SHEPHERD DOG",
  "KERRY BLUE TERRIER",
  "KING CHARLES SPANIEL",
  "KINTAMANI-BALI DOG",
  "KISHU",
  "KLEINER M\u00dcNSTERL\u00c4NDER",
  "KOMONDOR",
  "KOREA JINDO DOG",
  "KROMFOHRL\u00c4NDER",
  "KUVASZ",
  "LABRADOR RETRIEVER",
  "LAKELAND TERRIER",
  "LANCASHIRE HEELER",
  "LANDSEER (EUROPEAN CONTINENTAL TYPE)",
  "LAPPONIAN HERDER",
  "LARGE MUNSTERLANDER",
  "LEONBERGER",
  "LHASA APSO",
  "LITTLE LION DOG",
  "LONG-HAIRED PYRENEAN SHEEPDOG",
  "MAJORCA MASTIFF",
  "MAJORCA SHEPHERD DOG",
  "MALTESE",
  "MANCHESTER TERRIER",
  "MAREMMA AND THE ABRUZZES SHEEPDOG",
  "MASTIFF",
  "MEDIUM-SIZED ANGLO-FRENCH HOUND",
  "MINIATURE AMERICAN SHEPHERD",
  "MINIATURE BULL TERRIER",
  "MINIATURE PINSCHER",
  "MINIATURE SCHNAUZER",
  "MONTENEGRIN MOUNTAIN HOUND",
  "MUDI",
  "NEAPOLITAN MASTIFF",
  "NEDERLANDSE KOOIKERHONDJE",
  "NEWFOUNDLAND",
  "NORFOLK TERRIER",
  "NORMAN ARTESIEN BASSET",
  "NORRBOTTENSPITZ",
  "NORWEGIAN BUHUND",
  "NORWEGIAN ELKHOUND BLACK",
  "NORWEGIAN ELKHOUND GREY",
  "NORWEGIAN HOUND",
  "NORWEGIAN LUNDEHUND",
  "NORWICH TERRIER",
  "NOVA SCOTIA DUCK TOLLING RETRIEVER",
  "OLD DANISH POINTING DOG",
  "OLD ENGLISH SHEEPDOG",
  "OTTERHOUND",
  "PARSON RUSSELL TERRIER",
  "PEKINGESE",
  "PERUVIAN HAIRLESS DOG",
  "PETIT BASSET GRIFFON VENDEEN",
  "PETIT BRABAN\u00c7ON",
  "PHARAOH HOUND",
  "PICARDY SHEEPDOG",
  "PICARDY SPANIEL",
  "POITEVIN",
  "POLISH GREYHOUND",
  "POLISH HOUND",
  "POLISH HUNTING DOG",
  "POLISH LOWLAND SHEEPDOG",
  "PONT-AUDEMER SPANIEL",
  "POODLE",
  "PORCELAINE",
  "PORTUGUESE POINTING DOG",
  "PORTUGUESE SHEEPDOG",
  "PORTUGUESE WARREN HOUND-PORTUGUESE PODENGO",
  "PORTUGUESE WATER DOG",
  "POSAVATZ HOUND",
  "PRAGUE RATTER",
  "PRESA CANARIO",
  "PUDELPOINTER",
  "PUG",
  "PULI",
  "PUMI",
  "PYRENEAN MASTIFF",
  "PYRENEAN MOUNTAIN DOG",
  "PYRENEAN SHEEPDOG - SMOOTH FACED",
  "RAFEIRO OF ALENTEJO",
  "RHODESIAN RIDGEBACK",
  "ROMAGNA WATER DOG",
  "ROMANIAN BUCOVINA SHEPHERD",
  "ROMANIAN CARPATHIAN SHEPHERD DOG",
  "ROMANIAN MIORITIC SHEPHERD DOG",
  "ROTTWEILER",
  "RUSSIAN BLACK TERRIER",
  "RUSSIAN TOY",
  "RUSSIAN-EUROPEAN LAIKA",
  "SAARLOOS WOLFHOND",
  "SAINT GERMAIN POINTER",
  "SAINT MIGUEL CATTLE DOG",
  "SALUKI",
  "SAMOYED",
  "SCHILLERST\u00d6VARE",
  "SCHIPPERKE",
  "SCHNAUZER",
  "SCOTTISH TERRIER",
  "SEALYHAM TERRIER",
  "SEGUGIO MAREMMANO",
  "SERBIAN HOUND",
  "SERBIAN TRICOLOUR HOUND",
  "SHAR PEI",
  "SHETLAND SHEEPDOG",
  "SHIBA",
  "SHIH TZU",
  "SHIKOKU",
  "SIBERIAN HUSKY",
  "SKYE TERRIER",
  "SLOUGHI",
  "SLOVAKIAN CHUVACH",
  "SLOVAKIAN HOUND",
  "SMALL BLUE GASCONY",
  "SMALL SWISS HOUND",
  "SM\u00c5LANDSST\u00d6VARE",
  "SOUTH RUSSIAN SHEPHERD DOG",
  "SPANISH GREYHOUND",
  "SPANISH HOUND",
  "SPANISH MASTIFF",
  "SPANISH WATER DOG",
  "ST. BERNARD",
  "STABIJHOUN",
  "STAFFORDSHIRE BULL TERRIER",
  "SUSSEX SPANIEL",
  "SWEDISH LAPPHUND",
  "SWEDISH VALLHUND",
  "SWISS HOUND",
  "TAIWAN DOG",
  "TATRA SHEPHERD DOG",
  "THAI BANGKAEW DOG",
  "THAI RIDGEBACK DOG",
  "TIBETAN MASTIFF",
  "TIBETAN SPANIEL",
  "TIBETAN TERRIER",
  "TOSA",
  "TRANSMONTANO MASTIFF",
  "TYROLEAN HOUND",
  "VALENCIAN TERRIER",
  "WEIMARANER",
  "WELSH CORGI (CARDIGAN)",
  "WELSH CORGI (PEMBROKE)",
  "WELSH SPRINGER SPANIEL",
  "WELSH TERRIER",
  "WEST HIGHLAND WHITE TERRIER",
  "WEST SIBERIAN LAIKA",
  "WESTPHALIAN DACHSBRACKE",
  "WHIPPET",
  "WHITE SWISS SHEPHERD DOG",
  "WIRE-HAIRED POINTING GRIFFON KORTHALS",
  "WIREHAIRED SLOVAKIAN POINTER",
  "XOLOITZCUINTLE",
  "YAKUTIAN LAIKA",
  "YORKSHIRE TERRIER",
  "YUGOSLAVIAN SHEPHERD DOG - SHARPLANINA"
].map((breed) => breed.toTitleCase()).toList();

