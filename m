Message-ID: <001301c16731$47c473c0$4a1c690a@huawei.com>
From: "machael" <dony.he@huawei.com>
References: <013301c165cc$5d030fa0$4a1c690a@huawei.com><20011106130839.B30219@dea.linux-mips.net> <20011107.103947.74756322.nemoto@toshiba-tops.co.jp>
Subject: Re: vmalloc bugs in 2.4.5???
Date: Wed, 7 Nov 2001 10:09:49 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: ralf@oss.sgi.com, Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011107020949.naijbiYdQ_m76W8iu5067f6w6U7Bkg9XKr3PVUgOh0g@z>

> ralf> Vmalloc is probably innocent I'd rather guess cache flushing is
> ralf> broken on your platform.
> 
> In 2.4.5, flush_cache_all() (and flush_tlb_all()) is called in
> vmalloc_area_pages().  I think this call protect us from virtual
> aliasing problem.
> 
> By the way, does anybody have any problem with vmalloc on recent
> kernel?
> 
> In somewhere between 2.4.6 and 2.4.9, the call to flush_cache_all()
> disappered from vmalloc_area_pages().  I have a data corruption
> problem in vmalloc()ed area without this call.  I think we still need
> this call.
> 
> --- linux-sgi-cvs/mm/vmalloc.c Tue Sep 18 05:16:31 2001
> +++ linux.new/mm/vmalloc.c Wed Nov  7 10:33:47 2001
> @@ -144,6 +144,7 @@
>   int ret;
>  
>   dir = pgd_offset_k(address);
> + flush_cache_all();
>   spin_lock(&init_mm.page_table_lock);
>   do {
>   pmd_t *pmd;
> @@ -163,6 +164,7 @@
>   ret = 0;
>   } while (address && (address < end));
>   spin_unlock(&init_mm.page_table_lock);
> + flush_tlb_all();
>   return ret;
>  }

In 2.4.5, vmalloc has these two lines in vmalloc_area_pages().
So what else may be the problem?
Thanks!

machael
