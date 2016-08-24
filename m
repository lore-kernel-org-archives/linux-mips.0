Received: from mail-bl2nam02on0084.outbound.protection.outlook.com ([104.47.38.84]:5664
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992160AbcHXQvFnDttO (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 24 Aug 2016 18:51:05 +0200
Subject: Re: [PATCH] MIPS: OCTEON: mangle-port: fix build failure with VDSO
 code
References: <20160822220735.13865-1-aaro.koskinen@iki.fi>
 <57BB82F3.2030103@caviumnetworks.com>
From: "Steven J. Hill" <Steven.Hill@cavium.com>
Message-ID: <57BDD06C.6030004@cavium.com>
Date: Wed, 24 Aug 2016 11:50:52 -0500
MIME-Version: 1.0
In-Reply-To: <57BB82F3.2030103@caviumnetworks.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: David Daney <ddaney@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, Alex Smith <alex.smith@imgtec.com>
Message-ID: <20160824165052.CPhYaei_CP8886xVteTFWu1QF5-N4OV2_r4eT-olurs@z>

On 08/22/2016 05:55 PM, David Daney wrote:
>
> This looks like it should work.
>
> Steven, can you test this patch for us to get independent confirmation
> that it works?
>
> If testing shows that it is good, please add Acked-by: David Daney
> <david.daney@cavium.com>
>
Hey Aaro.

Patch tests out good. Go ahead add David's ack. Thanks.

Steve
