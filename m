Received: from mailapp01.imgtec.com ([195.89.28.115]:53429 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822092AbaDHLDqUf4Ft (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Apr 2014 13:03:46 +0200
Message-ID: <5343D799.2040203@imgtec.com>
Date: Tue, 8 Apr 2014 12:03:53 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] MIPS: Remove SMTC Support
References: <1396954750-24762-1-git-send-email-markos.chandras@imgtec.com> <1396954750-24762-2-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1396954750-24762-2-git-send-email-markos.chandras@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
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
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20140408110353.lyJxbJTXqt-oNcOE1AdPVEE6k1y8xysD0M8jHQRrhfk@z>

On 04/08/2014 11:59 AM, Markos Chandras wrote:
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 037a44d..e12843a 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -124,7 +124,6 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   	seq_printf(m, "kscratch registers\t: %d\n",
>   		      hweight8(cpu_data[n].kscratch_mask));
>   	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> -

Hi Ralf,

This change was not intentional. It's due to a bad merge conflict 
resolution. Could you please fix this before you merge this patch?

Thanks!

-- 
markos
