From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Subject: RE: [uClibc] Re: uclibc mips ld.so and undefined symbols with nonzerosymbol table entry st_value
Date: Tue, 11 May 2004 07:48:27 +0200
Message-ID: <BCEFJBPJCGFCNMMMIDBHKEONCFAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <02fd01c43709$981a24a0$8d01010a@prefect>
Return-Path: <Joakim.Tjernlund@lumentis.se>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Bradley D. LaRonde" <brad@laronde.org>, Richard Sandiford <rsandifo@redhat.com>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040511054827.cVrDQX0TTC7JTo_HuC8tJdJgvpahw_uvcdqmRaFn66U@z>

> 
> uClibc/ldso/ldso/mips/elfinterp.c around line 288 looks like this:
> 
> 
>     /* Relocate the global GOT entries for the object */
>     while(i--) {
>       if (sym->st_shndx == SHN_UNDEF) {
>         if (ELF32_ST_TYPE(sym->st_info) == STT_FUNC && sym->st_value)
>           *got_entry = sym->st_value + (unsigned long) tpnt->loadaddr;
>         else {
>           *got_entry = (unsigned long) _dl_find_hash(strtab +
>              sym->st_name, tpnt->symbol_scope, ELF_RTYPE_CLASS_COPY);
>         }
>      }
> 
> 
> If I change that ELF_RTYPE_CLASS_COPY to ELF_RTYPE_CLASS_PLT to tell
> _dl_find_hash to ignore stubs when resolving undefined functions without
> stubs, the dlopen tests all pass.  dlopen gets a pointer to the libc.so
> malloc instead of a pointer to the libpthread malloc stub.  Yay!  :-)
> 
> Does that look like the correct fix?

Hopefully, when I added ELF_RTYPE_CLASS_COPY/ELF_RTYPE_CLASS_PLT stuff I had to
guess what to do with MIPS. After that several minor error has been fixed by
changing these bits.

  Jocke
