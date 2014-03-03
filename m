Received: from mailapp01.imgtec.com ([195.89.28.114]:59463 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6822287AbaCCOFkPjvFB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 3 Mar 2014 15:05:40 +0100
Message-ID: <53148C5A.7020101@imgtec.com>
Date: Mon, 3 Mar 2014 14:06:18 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] MIPS: Set page size to 16KB for malta SMP defconfigs
References: <1392904828-12969-1-git-send-email-markos.chandras@imgtec.com> <1392904828-12969-4-git-send-email-markos.chandras@imgtec.com> <20140221173829.GI19285@linux-mips.org>
In-Reply-To: <20140221173829.GI19285@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140303140618.WlDpawrRUtmblDLyP5PgPU4-tC-qvOqcEq6A5HPzDQM@z>

On 02/21/2014 05:38 PM, Ralf Baechle wrote:
> On Thu, Feb 20, 2014 at 02:00:26PM +0000, Markos Chandras wrote:
>
>> From: Paul Burton <paul.burton@imgtec.com>
>>
>> For Malta defconfigs which may run on an SMP configuration without
>> hardware cache anti-aliasing, a 16KB page size is a safer default.
>> Most notably at the moment it will avoid cache aliasing issues for
>> multicore proAptiv systems.
>
> You're aware that this may cause binary compatibility issues with old
> userland?  So far the defaults were chosen to maximise compatibility
> over performance.
>
>    Ralf
>
Hi Ralf,

Are you referring to programs hard coding the page size to 4k instead of 
using the getpagesize()? Well yes this could be a problem. But is that a 
real problem? We are changing the default value so whoever has such an 
old userland can easily switch to the 4k page size. It may also be a 
good opportunity to expose such application and get the fixed properly 
:) But if that's not acceptable, we can drop the patch. Paul what do you 
think?

-- 
markos
