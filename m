Subject: Re: IDE DMA mode in Big endian for mips
Date: Sun, 21 Oct 2001 17:50:00 +0100 (BST)
In-Reply-To: <20011017.113842.41627007.nemoto@toshiba-tops.co.jp> from "Atsushi Nemoto" at Oct 17, 2001 11:38:42 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E15vLnU-0007CG-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: hli@quicklogic.com, linux-mips@oss.sgi.com
Message-ID: <20011021165000.9kG8YZlLxYqVJfV4awJFc3m5pFlXaqkODEYzPELUtDM@z>

>  				return 1;	/* try PIO instead of DMA */
> +#if defined(__mips__) && defined(__BIG_ENDIAN) /* XXX mips only? */
> +			outl(cpu_to_le32(hwif->dmatable_dma), dma_base + 4); /* PRD table */
> +#else
>  			outl(hwif->dmatable_dma, dma_base + 4); /* PRD table */
> +#endif

You should actually just be able to delete the #if stuff. On an LE machine
cpu_to_le32() is a null operation
