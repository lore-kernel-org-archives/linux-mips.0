From: Michl Ladislav <xmichl03@stud.fee.vutbr.cz>
Date: Wed, 2 May 2001 22:48:19 +0200 (CEST)
Subject: VINO - enabling DMA
Message-ID: <Pine.BSF.4.33.0105022139370.85671-100000@fest.stud.fee.vutbr.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010502204819.bZWsXPvMS56vupzM4vUfoflqwdhLMLEnSZ8WhRNrGWc@z>

when writing Linux VINO driver i followed documentation found at:
ftp://oss.sgi.com/pub/linux/mips/doc/indy/vino/vino.ps

shortly (if someone is interested, i can send whole code):
/* array of allocated pages */
unsigned long *pages;
/* same as above, but contains physical addresses */
unsigned long *buf_desc;

/* i hope page starts at 4k boundary ;) */
/* i also know that GFP_DMA is useless for MIPS */
buf_desc = (unsigned long *) __get_free_pages(GFP_KERNEL | GFP_DMA, 0);
pages = (unsigned long*) kmalloc(npage *
         sizeof(unsigned long), GFP_KERNEL));
for (i = 0; i < npage; i++) {
	pages[i] = __get_free_pages(GFP_KERNEL | GFP_DMA, 0);
	/* fill with something to see if vino writes data */
	memset((void *) pages[i], i, PAGE_SIZE);
	/* virt_to_bus returns PHYSADDR */
	buf_desc[i] = virt_to_bus((void *)pages[i]);
	mem_map_reserve(virt_to_page(pages[i]));
}
buf_desc[npage] = VINO_DESC_STOP;
/* here set all things according doc (page_index to zero and so on...)
...
/* write descriptor table pointer to vino */
vino_reg_write(virt_to_bus(buf_desc), VINO_A_DESC_TLB_PTR);
vino_reg_write(virt_to_bus(buf_desc), VINO_A_DESC_PTR);
/* and now start DMA */
vino_reg_or(VINO_CTRL_A_DMA_ENBL, VINO_CTRL);

after that memory stays untouched, no data are trasferred. any ideas how
to make DMA working? or better where to get more complete vino
documentation?

regards,
ladislav michl
