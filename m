Received: from mailapp01.imgtec.com ([195.59.15.196]:60927 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6826452AbaGVMcFz4tkq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Jul 2014 14:32:05 +0200
Message-ID: <53CE59BE.104@imgtec.com>
Date: Tue, 22 Jul 2014 13:31:58 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: OCTEON: make get_system_type() thread-safe
References: <1406029868-6210-1-git-send-email-aaro.koskinen@nsn.com>
In-Reply-To: <1406029868-6210-1-git-send-email-aaro.koskinen@nsn.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Aaro Koskinen <aaro.koskinen@nsn.com>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Message-ID: <20140722123158.CRAZseby4Rja2RMIsUHFjHLppY87Z44gzaOvC9Ss_VE@z>

On 07/22/2014 12:51 PM, Aaro Koskinen wrote:
> get_system_type() is not thread-safe on OCTEON. It uses static data,
> also more dangerous issue is that it's calling cvmx_fuse_read_byte()
> every time without any synchronization. Currently it's possible to get
> processes stuck looping forever in kernel simply by launching multiple
> readers of /proc/cpuinfo:
> 
> 	(while true; do cat /proc/cpuinfo > /dev/null; done) &
> 	(while true; do cat /proc/cpuinfo > /dev/null; done) &
> 	...
> 
> Fix by initializing the system type string only once during the early
> boot.
> 
> Signed-off-by: Aaro Koskinen <aaro.koskinen@nsn.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/mips/cavium-octeon/setup.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 

It looks reasonable to me.

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
markos
