Received: from mailapp01.imgtec.com ([195.59.15.196]:6575 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007106AbcB2OvlJyYGO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 29 Feb 2016 15:51:41 +0100
From: Govindraj Raja <Govindraj.Raja@imgtec.com>
Subject: Re: [PATCH v3] mips: scache: fix scache init with invalid line size.
References: <1456746080-29232-1-git-send-email-Govindraj.Raja@imgtec.com>
 <20160229144756.GA23538@linux-mips.org>
Message-ID: <56D45AF6.1060108@imgtec.com>
Date: Mon, 29 Feb 2016 14:51:34 +0000
MIME-Version: 1.0
In-Reply-To: <20160229144756.GA23538@linux-mips.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Govindraj.Raja@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: stable@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, James Hartley <james.hartley@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20160229145134.jAV4TDDUfKsNDPtfUFztuldkUP_6j_zu2L48bh4Xb8o@z>


On 29/02/16 14:47, Ralf Baechle wrote:
> On Mon, Feb 29, 2016 at 11:41:20AM +0000, Govindraj Raja wrote:
>
>> Cc: <stable@vger.kernel.org> # v4.2+
> You meant 4.3+; 4.2 doesn't have a mips_sc_probe_cm3 function.  Other
> than that, ok & applied.
>

Yes it was supposed to be 4.3+

thanks

--
Thanks,
Govindraj.R
