Received: from multi.imgtec.com ([194.200.65.239]:44269 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6835027Ab3FSVuc62qTM (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 19 Jun 2013 23:50:32 +0200
Message-ID: <51C2279F.3040901@imgtec.com>
Date: Wed, 19 Jun 2013 16:50:23 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] MIPS: Declare emulate_load_store_microMIPS as a static
 function.
References: <1369432450-13583-1-git-send-email-ddaney.cavm@gmail.com> <1369432450-13583-2-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1369432450-13583-2-git-send-email-ddaney.cavm@gmail.com>
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
Message-ID: <20130619215023.U2xun8bqL2XI31SO4CVunQNJThqoMbaoB4oezwQkGDk@z>

On 05/24/2013 04:54 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> It is only used from within a single file, it should not be globally
> visible.
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> Cc: Steven J. Hill <Steven.Hill@imgtec.com>
>
Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>
