Received: from nivc-ms1.auriga.com ([80.240.102.146]:36514 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007344AbaLQOt5A7hux (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 17 Dec 2014 15:49:57 +0100
Message-ID: <54919786.7020605@auriga.com>
Date: Wed, 17 Dec 2014 17:47:34 +0300
From: Aleksey Makarov <aleksey.makarov@auriga.com>
MIME-Version: 1.0
Subject: Re: [PATCH 09/14] MIPS: OCTEON: Add ability to used an initrd from
 a named memory block.
References: <1418666603-15159-1-git-send-email-aleksey.makarov@auriga.com> <1418666603-15159-10-git-send-email-aleksey.makarov@auriga.com> <20141215205316.GA10323@fuloong-minipc.musicnaut.iki.fi>
In-Reply-To: <20141215205316.GA10323@fuloong-minipc.musicnaut.iki.fi>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Leonid Rosenboim <lrosenboim@caviumnetworks.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20141217144734.5vrjudi0Dm6PObp0CNZZEmpqgy-fzOlatm0R4CuNfOo@z>


On 12/15/2014 11:53 PM, Aaro Koskinen wrote:
> On Mon, Dec 15, 2014 at 09:03:15PM +0300, Aleksey Makarov wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> If 'rd_name=xxx' is passed to the kernel, the named block with name
>> 'xxx' is used for the initrd.
> 
> Maybe use "initrd_name" for consistency or even just "initrd"
> (if the xxx is not in form of "address,size" you could assume it to refer
> to a named block).

As far as I can see it is already consistent as MIPS Linux uses "rd_start" and "rd_size" instead of "initrd".

Aleksey

> 
> A.
> .
> 
