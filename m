Reply-To: <raghav@ishoni.com>
From: "Raghav P" <raghav@ishoni.com>
Subject: Are page tables allocated in KSEG0 or in KSEG2?
Date: Sat, 30 Jun 2001 14:51:17 +0530
Message-ID: <E0FDC90A9031D511915D00C04F0CCD250399AA@leonoid.in.ishoni.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010630092117.EqrZZscawTDnG3Mccu06WQcOgKERFHsk-bV1Cr3AN2I@z>

I was going thru the TLB exception for R2300 and had the following doubts
which I hope someone can help me out with. ( am sorry if this is a newbie
question but since this is MIPS specific I am posting here)

The code is in arch/mips/kernel/head.S for user TLB:

        /* TLB refill, EXL == 0, R[23]00 version */
        LEAF(except_vec0_r2300)
        .set    noat
        .set    mips1
        mfc0    k0, CP0_BADVADDR
        lw      k1, current_pgd                 # get pgd pointer
        srl     k0, k0, 22
        sll     k0, k0, 2
        addu    k1, k1, k0
        mfc0    k0, CP0_CONTEXT
        lw      k1, (k1)
        and     k0, k0, 0xffc
        addu    k1, k1, k0
        lw      k0, (k1)
        nop
        mtc0    k0, CP0_ENTRYLO0
        mfc0    k1, CP0_EPC
        tlbwr
        jr      k1
        rfe
        END(except_vec0_r2300)

My linux book says that pgd and pte entries are not setup by the kernel
until a pagefault exception occurs.
The above code will work only if the pgd and pte tables are stored in kseg2;
if they were stored in kseg0 then if a pgd has an invalid pte entry the
above code will index into an invalid pte page and get a wrong physical
address.
But the pgd_alloc() and pte_alloc() routines seem to be allocating physical
pages from kseg0 for pgd and pte tables.
Am I missing something here???

Thanks
Raghav
