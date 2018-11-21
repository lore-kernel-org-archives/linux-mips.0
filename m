Received: from mail-eopbgr760102.outbound.protection.outlook.com ([40.107.76.102]:63940
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993843AbeKUSVaunvA0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Nov 2018 19:21:30 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: ptrace: introduce NT_MIPS_MSA regset
Date: Wed, 21 Nov 2018 18:21:27 +0000
Message-ID: <MWHPR2201MB1277D840F8AA64489C302390C1DA0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181120204049.19153-1-paul.burton@mips.com>
In-Reply-To: <20181120204049.19153-1-paul.burton@mips.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <pburton@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181121182127.dTahinGHqojfWx4u6Ax-LKjcTGq02iNn5Oadzrh3RW0@z>

Hello,

Paul Burton wrote:
> The current methods for obtaining FP context via ptrace only provide
> either 32 or 64 bits per data register. With MSA, where vector registers
> are aliased with scalar FP data registers, those registers are 128 bits
> wide. Thus a new mechanism is required for userland to access those
> registers via ptrace. This patch introduces an NT_MIPS_MSA regset which
> provides, in this order:
> 
> - The full 128 bits value of each vector register, in native
> endianness saved as though elements are doubles. That is, the format
> of each vector register is as would be obtained by saving it to
> memory using an st.d instruction.
> 
> - The 32 bit scalar FP implementation register (FIR).
> 
> - The 32 bit scalar FP control & status register (FCSR).
> 
> - The 32 bit MSA implementation register (MSAIR).
> 
> - The 32 bit MSA control & status register (MSACSR).
> 
> The provision of the FIR & FCSR registers in addition to the MSA
> equivalents allows scalar FP context to be retrieved as a subset of
> the context available via this regset. Along with the MSA equivalents
> they also nicely form the final 128 bit "register" of the regset.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
