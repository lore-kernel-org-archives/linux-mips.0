From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Tue, 11 May 2004 23:50:44 +0200
Message-ID: <BCEFJBPJCGFCNMMMIDBHOEPBCFAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <053f01c43778$c2903390$8d01010a@prefect>
Return-Path: <Joakim.Tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Daniel Jacobowitz <dan@debian.org>
Cc: uclibc@uclibc.org, Richard Sandiford <rsandifo@redhat.com>, linux-mips@linux-mips.org
Message-ID: <20040511215044.Giu78vCQROz5vvuD_g6oDcj4ZqoQAFfAl1Eb3vvmgiY@z>

> > > >
> > > > Probably, since MIPS doesn't have a copy reloc.
> > >
> > > How about the other copy reloc right below there:
> > >
> > >     else if (sym->st_shndx == SHN_COMMON) {
> > >       *got_entry = (unsigned long) _dl_find_hash(strtab +
> > >         sym->st_name, tpnt->symbol_scope, ELF_RTYPE_CLASS_COPY);
> > >     }
> > >
> > > ?
> >
> > Perhaps DL_NO_COPY_RELOCS should be defined for MIPS then?
> > see ldso/include/dl-elf.h.
> 
> For mips glibc 2.3.3 does:
> 
> #define elf_machine_type_class(type)            ELF_RTYPE_CLASS_PLT
> 
> and never uses ELF_RTYPE_CLASS_COPY directly (though it does use
> ELF_RTYPE_CLASS_PLT directly).
> 
> Regards,
> Brad
> 

Good, try replacing all ELF_RTYPE_CLASS_COPY with ELF_RTYPE_CLASS_PLT in 
mips/elfinterp.c and define DL_NO_COPY_RELOCS in mips/dl-sysdep.h

  Jocke
