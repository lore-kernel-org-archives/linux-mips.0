Received: from mailapp02.imgtec.com ([217.156.133.132]:59775 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992544AbdJLOcwA8SRk convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 12 Oct 2017 16:32:52 +0200
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Subject: RE: [PATCH 1/2] MIPS: math-emu: Update debugfs FP exception stats
 for certain instructions
Date: Thu, 12 Oct 2017 14:32:38 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B85015DA0B50E@badag02.ba.imgtec.org>
References: <1507310955-3525-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1507310955-3525-2-git-send-email-aleksandar.markovic@rt-rk.com>
 <20171009210923.GA20378@jhogan-linux>
 <EF5FA6C3467F85449672C3E735957B85015DA0AF13@badag02.ba.imgtec.org>,<20171012101753.GB15235@jhogan-linux>
In-Reply-To: <20171012101753.GB15235@jhogan-linux>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Aleksandar.Markovic@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@mips.com>
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Douglas Leung <Douglas.Leung@imgtec.com>, Goran Ferenc <Goran.Ferenc@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maciej Rozycki <Maciej.Rozycki@imgtec.com>, Manuel Lauss <manuel.lauss@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Paul Burton <Paul.Burton@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20171012143238.Liu6wmHvv9UvBBD3eKT-Mz2OKevBpIjL95lTMxVvm-c@z>


(resending since the previous mail was rejected by the mailing list because of html format)

> Subject: Re: [PATCH 1/2] MIPS: math-emu: Update debugfs FP exception stats for certain instructions
> Date: Thursday, October 12, 2017 12:17 CEST
> From: James Hogan <james.hogan@mips.com>>
> > ...
> > if ((ctx->fcr31 >> 5) & ctx->fcr31 & FPU_CSR_ALL_E)
> > ...
>
> But just before that condition it does:
>
> ctx->fcr31 = (ctx->fcr31 & ~FPU_CSR_ALL_X) | rcsr;
> I.e. it clears the X bits used in the condition, and overrides them,
> based on rcsr, which is initialised to 0 and is only set after the
> copcsr label and in a couple of other cases I don't think we'd be
> hitting for MADDF.
>

The code is odd and deceiving here. Let's see the whole "copcsr label"
code segment:
 
copcsr:
if (ieee754_cxtest(IEEE754_INEXACT)) {
    MIPS_FPU_EMU_INC_STATS(ieee754_inexact);
    rcsr |= FPU_CSR_INE_X | FPU_CSR_INE_S;
}
if (ieee754_cxtest(IEEE754_UNDERFLOW)) {
    MIPS_FPU_EMU_INC_STATS(ieee754_underflow);
    rcsr |= FPU_CSR_UDF_X | FPU_CSR_UDF_S;
}
if (ieee754_cxtest(IEEE754_OVERFLOW)) {
    MIPS_FPU_EMU_INC_STATS(ieee754_overflow);
    rcsr |= FPU_CSR_OVF_X | FPU_CSR_OVF_S;
}
if (ieee754_cxtest(IEEE754_INVALID_OPERATION)) {
    MIPS_FPU_EMU_INC_STATS(ieee754_invalidop);
    rcsr |= FPU_CSR_INV_X | FPU_CSR_INV_S;
}
 
ctx->fcr31 = (ctx->fcr31 & ~FPU_CSR_ALL_X) | rcsr;
if ((ctx->fcr31 >> 5) & ctx->fcr31 & FPU_CSR_ALL_E) {
    /*printk ("SIGFPE: FPU csr = %08x\n",
    ctx->fcr31); */
    return SIGFPE;
}


Value of rcsr will be dictated by series of invocations to ieee754_cxtest(),
which, in fact, means that exception bits will be copied from fcr31 to rcsr.

Then, fcr31 exception bits are cleared and set to the values they had just
before clearing.

Obviously, this will not do anything in our scenarios.

However, the patch is about correct setting of debugfs stats, and this code
segment correctly does this.

May I suggest that we accept my patch as is, and if anybody for any reason
wants to deal further with related code, this should be done in a separate
fix/patch?

Regards,
Aleksandar
