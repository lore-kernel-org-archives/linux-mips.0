Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:35442 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993097AbeFSXYsGUEqV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 01:24:48 +0200
Date: Tue, 19 Jun 2018 16:24:38 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v3] Make elf2ecoff work on 64bit host machines
Message-ID: <20180619232438.t3xbd4dkqr6t5oo5@pburton-laptop>
References: <20180605100021.14673-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180605100021.14673-1-tbogendoerfer@suse.de>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180619232438.WSMPng2eg0j_wBAwNmH620cViGp7JQxXbe6cMkzXNIY@z>

Hi Thomas,

On Tue, Jun 05, 2018 at 12:00:20PM +0200, Thomas Bogendoerfer wrote:
> Use fixed width integer types for ecoff structs to make elf2ecoff work
> on 64bit host machines
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Reviewed-by: Paul Burton <paul.burton@mips.com>
> ---
> 
> v3: include stdint.h in ecoff.h
>     missed one printf format
> 
> v2: include stdint.h and use inttypes.h for printf formats
> 
>  arch/mips/boot/ecoff.h     | 61 ++++++++++++++++++++++++----------------------
>  arch/mips/boot/elf2ecoff.c | 31 +++++++++++------------
>  2 files changed, 48 insertions(+), 44 deletions(-)

Thanks - applied to mips-next for 4.19.

Paul
