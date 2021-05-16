" Vim syn file
" nLanguage:   Gedcom
" Maintainer: Alan Levin
" Version 1.0 - 22 March 2021
"
if exists("b:current_syntax")
    finish
endif
" Keywords
syn case match
"
syn keyword gedcom_record ABBR ADDR ADOP ADR1 ADR2 AFN AGE AGNC ALIA ANCE
syn keyword gedcom_record ANCI ANUL ASSO AUTH BAPL BAPM BARM BASM BIRT BLES
syn keyword gedcom_record BLOB BURI CALN CAST CAUS CENS CHAN CHAR CHIL CHR
syn keyword gedcom_record CHRA CITY CONC CONF CONL CONT COPR CORP CREM CTRY
syn keyword gedcom_record DATA DEAT DESC DESI DEST DIV DIVF DSCR EDUC EMIG
syn keyword gedcom_record ENDL ENGA EVEN FAM FAMC FAMF FAMS FCOM FILE FORM
syn keyword gedcom_record GEDC GIVN GRAD HEAD HUSB IDNO IMMI INDI LANG MARB
syn keyword gedcom_record MARC MARL MARR MARS MEDI NATI NATU NCHI NICK NMR
syn keyword gedcom_record NOTE NPFX NSFX OBJE OCCU ORDI ORDN PAGE PEDI PHON
syn keyword gedcom_record PLAC POST PROB PROP PUBL QUAY REFN RELA RELI REPO
syn keyword gedcom_record RESI RESN RETI RFN RIN ROLE SEX SLGC SLGS SOUR
syn keyword gedcom_record SPFX SSN STAE STAT SUBM SUBN SURN TEMP TEXT TIME
syn keyword gedcom_record TITL TRLR TYPE VERS WIFE WILL
syn keyword gedcom_record DATE nextgroup=gedcom_date
syn keyword gedcom_record NAME nextgroup=gedcom_name
"
syn case ignore

syn region gedcom_id start="@" end="@" oneline contains=gedcom_ii, gedcom_in
syn match gedcom_ii "\I\+" contained nextgroup=gedcom_in
syn match gedcom_in "\d\+" contained
syn region gedcom_name start="" end="$" skipwhite oneline contains=gedcom_cname, gedcom_surname contained
syn match gedcom_cname "\i\+" contained
syn match gedcom_surname "/\(\i\|\s\)*/" contained
syn match gedcom_date "\d\{1,2}\s\+\(jan\|feb\|mar\|apr\|may\|jun\|jul\|aug\|sep\|oct\|nov\|dec\)\s\+\d\+"
syn match gedcom_date ".*" contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
let b:current_syn = "gedcom"

" if version >= 508 || !exists("did_gedcom_syn_inits")
"    if version < 508
"        let did_gedcom_syn_inits = 1
"        command -nargs=+ HiLink hi link <args>
"    else
"        command -nargs=+ HiLink hi def link <args>
"    endif
"    
hi link gedcom_record Statement
hi link gedcom_id Statement
hi link gedcom_ii Type
hi link gedcom_in PreProc
hi link gedcom_name Comment
hi link gedcom_cname Comment
hi link gedcom_surname Type
hi link gedcom_date Constant

"delcommand HiLink
"endif

