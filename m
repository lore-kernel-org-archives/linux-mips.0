Received: from mail-bl2on0091.outbound.protection.outlook.com ([65.55.169.91]:16896
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27008884AbaLOVbmvNDF1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 15 Dec 2014 22:31:42 +0100
Message-ID: <548F5330.6090508@caviumnetworks.com>
Date: Mon, 15 Dec 2014 13:31:28 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 13/14] MIPS: OCTEON: Add register definitions for OCTEON
 III reset unit.
References: <1418666603-15159-1-git-send-email-aleksey.makarov@auriga.com> <1418666603-15159-14-git-send-email-aleksey.makarov@auriga.com> <20141215210942.GC10323@fuloong-minipc.musicnaut.iki.fi>
In-Reply-To: <20141215210942.GC10323@fuloong-minipc.musicnaut.iki.fi>
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
Cc: Aleksey Makarov <feumilieu@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20141215213128.c8ihc7qZevOusUdT_t78oxqYTL6qglNAmWPuxj-SoWM@z>

On 12/15/2014 01:09 PM, Aaro Koskinen wrote:
> Hi,
>
> On Mon, Dec 15, 2014 at 09:03:19PM +0300, Aleksey Makarov wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> Needed by follow-on patches.
>
> Looks like only one of the unions was needed (cvmx_rst_boot)...?
>

This follows the form of the other register definition files.

If Ralf requests it, we would consider deleting some of the currently 
unused definitions.

David Daney
