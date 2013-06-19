Received: from multi.imgtec.com ([194.200.65.239]:50378 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835001Ab3FSVuir1JT6 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Jun 2013 23:50:38 +0200
Message-ID: <51C227A5.4030902@imgtec.com>
Date: Wed, 19 Jun 2013 16:50:29 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: Don't try to decode microMIPS branch instructions
 where they cannot exist.
References: <1369432450-13583-1-git-send-email-ddaney.cavm@gmail.com> <1369432450-13583-3-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1369432450-13583-3-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20130619215029.m4K2_KwXsStpx3sYwUsLU402PcHDYU0Vab5w6cawD-Y@z>

On 05/24/2013 04:54 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> In mm_isBranchInstr() we can short circuit the entire function if
> !cpu_has_mmips.
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> Cc: Steven J. Hill <Steven.Hill@imgtec.com>
>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
