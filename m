Message-ID: <053f01c43778$c2903390$8d01010a@prefect>
From: "Bradley D. LaRonde" <brad@laronde.org>
References: <JPEALJAFNGDDLOPNDIEEIEFKCIAA.joakim.tjernlund@lumentis.se>
Subject: Re: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Tue, 11 May 2004 12:55:27 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@laronde.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>, Daniel Jacobowitz <dan@debian.org>
Cc: uclibc@uclibc.org, Richard Sandiford <rsandifo@redhat.com>, linux-mips@linux-mips.org
Message-ID: <20040511165527.bhSQ2vDl83KzNWWCh-pS9ESZCJjrTzYZ5LPkahWT_XE@z>

----- Original Message ----- 
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Bradley D. LaRonde" <brad@laronde.org>; "Daniel Jacobowitz"
<dan@debian.org>
Cc: <uclibc@uclibc.org>; "Richard Sandiford" <rsandifo@redhat.com>;
<linux-mips@linux-mips.org>
Sent: Tuesday, May 11, 2004 12:33 PM
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with
nonzerosymbol table entry st_value


> > >
> > > Probably, since MIPS doesn't have a copy reloc.
> >
> > How about the other copy reloc right below there:
> >
> >     else if (sym->st_shndx == SHN_COMMON) {
> >       *got_entry = (unsigned long) _dl_find_hash(strtab +
> >         sym->st_name, tpnt->symbol_scope, ELF_RTYPE_CLASS_COPY);
> >     }
> >
> > ?
>
> Perhaps DL_NO_COPY_RELOCS should be defined for MIPS then?
> see ldso/include/dl-elf.h.

For mips glibc 2.3.3 does:

#define elf_machine_type_class(type)            ELF_RTYPE_CLASS_PLT

and never uses ELF_RTYPE_CLASS_COPY directly (though it does use
ELF_RTYPE_CLASS_PLT directly).

Regards,
Brad
