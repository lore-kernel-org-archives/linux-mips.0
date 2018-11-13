Received: from mail-eopbgr770100.outbound.protection.outlook.com ([40.107.77.100]:6211
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993109AbeKMWWYPFCpu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:24 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Avoid using .set mips0 to restore ISA
Date: Tue, 13 Nov 2018 22:22:22 +0000
Message-ID: <CY4PR2201MB127215A140FD8D4393A70363C1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181108201426.18512-1-paul.burton@mips.com>
In-Reply-To: <20181108201426.18512-1-paul.burton@mips.com>
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
Message-ID: <20181113222222.5_OwxkkZ4TfnV43uh-I0JvostOhKZl6IP0r5nMg0lA0@z>

Hello,

Paul Burton wrote:
> We currently have 2 commonly used methods for switching ISA within
> assembly code, then restoring the original ISA.
> 
> 1) Using a pair of .set push & .set pop directives. For example:
> 
> .set	push
> .set	mips32r2
> <some_insn>
> .set	pop
> 
> 2) Using .set mips0 to restore the ISA originally specified on the
> command line. For example:
> 
> .set	mips32r2
> <some_insn>
> .set	mips0
> 
> Unfortunately method 2 does not work with nanoMIPS toolchains, where the
> assembler rejects the .set mips0 directive like so:
> 
> Error: cannot change ISA from nanoMIPS to mips0
> 
> In preparation for supporting nanoMIPS builds, switch all instances of
> method 2 in generic non-platform-specific code to use push & pop as in
> method 1 instead. The .set push & .set pop is arguably cleaner anyway,
> and if nothing else it's good to consistently use one method.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
