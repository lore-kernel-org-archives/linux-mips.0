From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Tue, 11 May 2004 18:33:42 +0200
Message-ID: <JPEALJAFNGDDLOPNDIEEIEFKCIAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <046a01c43763$42feeeb0$8d01010a@prefect>
Return-Path: <joakim.tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Daniel Jacobowitz <dan@debian.org>
Cc: uclibc@uclibc.org, Richard Sandiford <rsandifo@redhat.com>, linux-mips@linux-mips.org
Message-ID: <20040511163342.-nmydTGnTYq3q2nk0FxA-bqrrJ8PJGLa6-8mnwPLUL8@z>

> >
> > Probably, since MIPS doesn't have a copy reloc.
> 
> How about the other copy reloc right below there:
> 
>     else if (sym->st_shndx == SHN_COMMON) {
>       *got_entry = (unsigned long) _dl_find_hash(strtab +
>         sym->st_name, tpnt->symbol_scope, ELF_RTYPE_CLASS_COPY);
>     }
> 
> ?

Perhaps DL_NO_COPY_RELOCS should be defined for MIPS then?
see ldso/include/dl-elf.h.

 Jocke
