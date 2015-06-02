Received: from resqmta-ch2-04v.sys.comcast.net ([69.252.207.36]:35858 "EHLO
        resqmta-ch2-04v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026874AbbFBS5KN2P04 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 2 Jun 2015 20:57:10 +0200
Message-ID: <556DFC72.9010705@gentoo.org>
Date: Tue, 02 Jun 2015 14:56:50 -0400
From: Joshua Kinard <kumba@gentoo.org>
MIME-Version: 1.0
Subject: Re: IP27: R14000: Unexpected General Exception in cpu_set_fpu_fcsr_mask()
References: <556943D9.7020502@gentoo.org> <alpine.LFD.2.11.1506010025410.22908@eddie.linux-mips.org> <556BCA01.1070208@gentoo.org> <alpine.LFD.2.11.1506011218590.22908@eddie.linux-mips.org> <556D378C.8060503@gentoo.org> <alpine.LFD.2.11.1506021208120.22908@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1506021208120.22908@eddie.linux-mips.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-Path: <kumba@gentoo.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Linux MIPS List <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150602185650.YUdjoRp0gk2LX1Ro1maS8aedSnbwcm5zx_D7dabbCeY@z>

On 06/02/2015 07:32, Maciej W. Rozycki wrote:
> On Tue, 2 Jun 2015, Joshua Kinard wrote:
> 
>> I commented on it being odd because out of four CPUs, #2 was coming up with a
>> sign-extended value, twice (I tested two reboot cycles, same both times).  I'm
>> not fully knowledgable of IP27 hardware, and am probably one of the few on the
>> planet in possession of R14K node boards, so this might be a quirk of these
>> specific nodes.  Would need others to test to verify, I guess.
> 
>  That's how the CFC1 instruction works, it sign-extends the 32-bit value 
> written to the destination register on 64-bit processors.  So if the chip 
> has come out of reset with FCSR.FCC[7] set, then the bit will be repeated 
> across bits 63:32 when the bit pattern from FCSR has been transferred to a 
> general-purpose register.
> 
>> As for a typo, nope:
>>
>> 	__enable_fpu(FPU_AS_IS);
>>
>> 	fcsr = read_32bit_cp1_register(CP1_STATUS);
>> ->	pr_info("CPU%d: FCSR is: %08lx\n", smp_processor_id(), fcsr);
>> 	fcsr &= ~mask;
> 
>  OK, thanks for confirming.  So it looks like the cause of the exception 
> vanished at the same time.  There's no harm in reinitialising FCSR here 
> though, any vendor-specific bits possibly set will be cleared on process 
> creation anyway.

I had a thought and moved the printk to be near the top of cpu_probe(), since
it was possible the value of fcsr was getting clobbered by earlier code.  sure
enough, I got saner-looking values:
