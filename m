Received: from mail-eopbgr770125.outbound.protection.outlook.com ([40.107.77.125]:57216
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993030AbeKMWWGI3jGu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2018 23:22:06 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 0/3] MIPS: DEC: DECstation defconfig refresh and new
  templates
Date: Tue, 13 Nov 2018 22:22:04 +0000
Message-ID: <CY4PR2201MB1272EE0A0450B421A102D091C1C20@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <alpine.LFD.2.21.1811050219130.20378@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1811050219130.20378@eddie.linux-mips.org>
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
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181113222204.Oz00XPOu6Y1OEEZpk0LyPBWjSY2Yj8iHySWI4ryu364@z>

Hello,

Maciej W. Rozycki wrote:
> Hi,
> 
> It's been a while since the DECstation defconfig has been last actually
> updated rather than merely regenerated.  My `git log' examination points
> at commit 3f821640341b ("[MIPS] DECstation defconfig update") from 2006.
> 
> We have since gained a bunch of new drivers and also some drivers were
> unnecessarily disabled.  Therefore I have decided to refresh the defconfig
> (1/3), and to make people's life easier also to provide an R4k version
> (2/3) and a 64-bit version (3/3), covering all the three base DECstation
> configurations.  Apart from being ready to use with actual systems these
> additional defconfigs should make it easier for automated tools to verify
> correctness of the non-R3k configurations.
> 
> These were all verified to build and boot multiuser.  Please apply.
> 
> Maciej

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
