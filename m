Message-ID: <02fd01c43709$981a24a0$8d01010a@prefect>
From: "Bradley D. LaRonde" <brad@laronde.org>
References: <045b01c43155$1e06cd80$8d01010a@prefect><874qqpg2ti.fsf@redhat.com> <012701c43607$83aa65f0$8d01010a@prefect><87pt9cwwzu.fsf@redhat.com> <00e201c436b9$5fa0f450$8d01010a@prefect><878yg0m9db.fsf@redhat.com> <01a901c436ce$7029d890$8d01010a@prefect> <87oeowkoa6.fsf@redhat.com>
Subject: Re: uclibc mips ld.so and undefined symbols with nonzero symbol table entry st_value
Date: Mon, 10 May 2004 23:39:41 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@laronde.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Richard Sandiford <rsandifo@redhat.com>
Cc: uclibc@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20040511033941.9VL7LKKpMGj_rT3n_zeeNG5lRR71EI4QfIscoTydi9U@z>

----- Original Message ----- 
From: "Richard Sandiford" <rsandifo@redhat.com>
To: "Bradley D. LaRonde" <brad@laronde.org>
Cc: <uclibc@uclibc.org>; <linux-mips@linux-mips.org>
Sent: Monday, May 10, 2004 4:41 PM
Subject: Re: uclibc mips ld.so and undefined symbols with nonzero symbol
table entry st_value


> "Bradley D. LaRonde" <brad@laronde.org> writes:
> > I read this in the spec:
> >
> >     All externally visible symbols, both defined and undefined,
> >     must be hashed into the hash table.
> >
> > Should libpthread's malloc stub be added to the hash table?
>
> Yes.
>
> > I guess not, but I think that might be happening (haven't verified),
> > and libdl finding it in there and thinking it is the real deal, not
> > realizing it is just a stub.
>
> If you have an undefined function symbol with st_value != 0, then
> that st_value must be for a stub.  That's how the loader can (and is
> supposed to) tell the difference.
>
> It's probably a good idea to look at how glibc handles this.

uClibc/ldso/ldso/mips/elfinterp.c around line 288 looks like this:


    /* Relocate the global GOT entries for the object */
    while(i--) {
      if (sym->st_shndx == SHN_UNDEF) {
        if (ELF32_ST_TYPE(sym->st_info) == STT_FUNC && sym->st_value)
          *got_entry = sym->st_value + (unsigned long) tpnt->loadaddr;
        else {
          *got_entry = (unsigned long) _dl_find_hash(strtab +
             sym->st_name, tpnt->symbol_scope, ELF_RTYPE_CLASS_COPY);
        }
     }


If I change that ELF_RTYPE_CLASS_COPY to ELF_RTYPE_CLASS_PLT to tell
_dl_find_hash to ignore stubs when resolving undefined functions without
stubs, the dlopen tests all pass.  dlopen gets a pointer to the libc.so
malloc instead of a pointer to the libpthread malloc stub.  Yay!  :-)

Does that look like the correct fix?


Regards,
Brad
