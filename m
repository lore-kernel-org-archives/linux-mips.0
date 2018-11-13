Received: from mail-eopbgr770132.outbound.protection.outlook.com ([40.107.77.132]:18461
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993097AbeKMWWW0d3pu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:22 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Hardcode cpu_has_mmips=1 for microMIPS kernels
Date: Tue, 13 Nov 2018 22:22:21 +0000
Message-ID: <CY4PR2201MB12729A8373E66B296CE8DB5AC1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20181107231931.6136-1-paul.burton@mips.com>
In-Reply-To: <20181107231931.6136-1-paul.burton@mips.com>
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
Message-ID: <20181113222221.fLF6KVDuOaXPknCgkPpyMzv31pa1tu8cxuyNpCX1sbM@z>

Hello,

Paul Burton wrote:
> If we built the kernel targeting the microMIPS ISA then the very fact
> that the kernel is running implies that the CPU supports microMIPS. Thus
> we can hardcode cpu_has_mmips to 1 allowing the compiler greater scope
> for optimisation due to the compile-time constant.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
