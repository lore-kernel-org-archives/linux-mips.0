Received: from mail-eopbgr770128.outbound.protection.outlook.com ([40.107.77.128]:22496
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992716AbeKSVRv2FeVg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Nov 2018 22:17:51 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Remove superfluous check for __linux__
Date: Mon, 19 Nov 2018 21:17:48 +0000
Message-ID: <MWHPR2201MB1277E62483AFF08E7EFFAF92C1D80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20181116160939.22085-1-sean@mess.org>
In-Reply-To: <20181116160939.22085-1-sean@mess.org>
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
To: Sean Young <sean@mess.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <pburton@wavecomp.com>, James Hogan <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181119211748.sme7pebaJTPWnwzxY2NrKdsFL2N9lHouP8OtoSi-dB0@z>

Hello,

Sean Young wrote:
> When building BPF code using "clang -target bpf -c", clang does not
> define __linux__.
> 
> To build BPF IR decoders the include linux/lirc.h is needed which
> includes linux/types.h. Currently this workaround is needed:
> 
> https://git.linuxtv.org/v4l-utils.git/commit/?id=dd3ff81f58c4e1e6f33765dc61ad33c48ae6bb07
> 
> This check might otherwise be useful to stop users from using a non-linux
> compiler, but if you're doing that you are going to have a lot more
> trouble anyway.
> 
> Signed-off-by: Sean Young <sean@mess.org>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
