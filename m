Received: from mail-bl2on0090.outbound.protection.outlook.com ([65.55.169.90]:39840
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010081AbbC3S7ZmrVII (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 30 Mar 2015 20:59:25 +0200
Message-ID: <55199CFC.5070307@caviumnetworks.com>
Date: Mon, 30 Mar 2015 11:59:08 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] watchdog: octeon: convert to WATCHDOG_CORE API
References: <1427565940-22951-1-git-send-email-aaro.koskinen@iki.fi> <551992F0.5050809@gmail.com> <20150330185150.GD571@fuloong-minipc.musicnaut.iki.fi>
In-Reply-To: <20150330185150.GD571@fuloong-minipc.musicnaut.iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, David Daney <david.daney@cavium.com>, linux-watchdog@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150330185908.bIsE0XOfacvjOWZ7TrO1hJeLi5FDKv5-cGXJrY_82UI@z>

On 03/30/2015 11:51 AM, Aaro Koskinen wrote:
[...]
>
>> Thanks for doing this, I had been meaning to make the conversion myself.
>
> One further improvement idea would be to get the register dump logged
> also with printk() or panic() so that it could be captured with netconsole
> or mtdoops (at least in some cases). Not sure what it would require.
> Calling printk() or panic() from the NMI handler didn't quite produce
> an expected result...

In the handler we are running with a private stack, and at 
CP0_Status[ERL].  The result is that no access to the current task 
structure is possible, and interrupts are disabled.  So there is very 
little you can do.

Polling characters out of the UART works fine though.


>
> A.
>
