Received: from nwd2mail11.analog.com ([137.71.25.57]:22368 "EHLO
	nwd2mail11.analog.com") by ftp.linux-mips.org with ESMTP
	id S20038488AbWJEKJX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 5 Oct 2006 11:09:23 +0100
Received: from nwd2exm4.ad.analog.com (nwd2exm4.ad.analog.com [10.64.53.123])
	by nwd2mhb2.analog.com (8.9.3 (PHNE_28810+JAGae91741)/8.9.3) with ESMTP id GAA18664
	for <linux-mips@linux-mips.org>; Thu, 5 Oct 2006 06:09:24 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: R300 Mips Question
Date: Thu, 5 Oct 2006 06:09:19 -0400
Message-ID: <7D453D0504B6A2429F98F4D72CBEDE490D7D8795@nwd2exm5.ad.analog.com>
From: "Kota, Ramgopal" <Ramgopal.Kota@analog.com>
Return-Path: <Ramgopal.Kota@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061005100919.wdSTBb9HgUeHhMkPa7dDRAi7UpGQAcJLqrwEJCvn9rI@z>

Hi,

I am new to MIPS and uclinux port.I am getting familiarised with 2.6.18
linux code.
I see the following code in asm/mips/kernel/genex.S &
asm/mips/kernel/traps.c

++++++++++++ Genex.S  +++++++++++++
NESTED(except_vec3_generic, 0, sp)
        .set    push
        .set    noat
#if R5432_CP0_INTERRUPT_WAR
        mfc0    k0, CP0_INDEX
#endif
        mfc0    k1, CP0_CAUSE
        andi    k1, k1, 0x7c
#ifdef CONFIG_64BIT
        dsll    k1, k1, 1
#endif
        PTR_L   k0, exception_handlers(k1)
        jr      k0
        .set    pop
        END(except_vec3_generic)

+++++++++++++ traps.c +++++++++++++++
        set_except_vector(0, handle_int);
        set_except_vector(1, handle_tlbm);
        set_except_vector(2, handle_tlbl);
        set_except_vector(3, handle_tlbs);

        set_except_vector(4, handle_adel);
        set_except_vector(5, handle_ades);

        set_except_vector(6, handle_ibe);
        set_except_vector(7, handle_dbe);

        set_except_vector(8, handle_sys);
        set_except_vector(9, handle_bp);
        set_except_vector(10, handle_ri);
        set_except_vector(11, handle_cpu);
        set_except_vector(12, handle_ov);
        set_except_vector(13, handle_tr);

In R3000 manual , bits 2-6 indicate exception code value. In genex.S ,
the cause register is anded with 0x7c to extract 2-6 bits. 
I am not able to understand why it is not shifted the last 2 bits.

Please try to educate me why this is not done.

Ramgopal Kota 
