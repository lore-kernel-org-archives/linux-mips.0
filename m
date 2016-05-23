Received: from mail-by2on0068.outbound.protection.outlook.com ([207.46.100.68]:13402
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27027124AbcEWTDqg9pG9 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 23 May 2016 21:03:46 +0200
Message-ID: <57435406.1060104@caviumnetworks.com>
Date: Mon, 23 May 2016 12:03:34 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: THP broken on OCTEON?
References: <20160523151346.GA23204@ak-desktop.emea.nsn-net.net> <20160523152007.GB28729@linux-mips.org> <57432E02.9000008@gmail.com> <20160523185226.GA1253@raspberrypi.musicnaut.iki.fi>
In-Reply-To: <20160523185226.GA1253@raspberrypi.musicnaut.iki.fi>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Aaro Koskinen <aaro.koskinen@nokia.com>, Joshua Kinard <kumba@gentoo.org>, linux-mips@linux-mips.org, "Hill, Steven" <Steven.Hill@cavium.com>
Message-ID: <20160523190334.szE3C_KTfTarrgX7-T0GgCZxtAmFOHSiBbDREvgS0Go@z>

On 05/23/2016 11:52 AM, Aaro Koskinen wrote:
> On Mon, May 23, 2016 at 09:21:22AM -0700, David Daney wrote:
>> On 05/23/2016 08:20 AM, Ralf Baechle wrote:
>>> On Mon, May 23, 2016 at 06:13:46PM +0300, Aaro Koskinen wrote:
>>>> I'm getting kernel crashes (see below) reliably when building Perl in
>>>> parallel (make -j16) on OCTEON EBH5600 board (8 cores, 4 GB RAM) with
>>>> Linux 4.6.
>>>>
>>>> It seems that CONFIG_TRANSPARENT_HUGEPAGE has something to do with the
>>>> issue - disabling it makes build go through fine.
>>>>
>>>> Any ideas?
>>>
>>> I thought it was working except on SGI Origin 200/2000 aka IP27 where
>>> Joshua Kinard (added to cc) was hitting issues as well.
>>>
>>> Joshua, does that similar to the issues you were hitting?
>>
>> There is nothing OCTEON specific in the THP code, or huge pages in general.
>>
>> That said, we have seen other THP related failures, and have never been able
>> to find the cause.
>>
>> If someone can come up with a reproducible test case that triggers quickly,
>> we can run it in our simulator and easily find the problem.
>
> Trying to build Perl is a reliable reproducer. Is that too heavyweight
> for your simulator?
>
> I was able to reproduce this also on EdgeRouter Pro, but there the kernel
> does not fail, only compiler dies with SIGBUS:
>
> [  315.095264] Data bus error, epc == 0000000000a801c4, ra == 0000000000a80624
>
> And without THP the build is fine.
>
> I also tried CN68XX board with 16 GB RAM and also there I get SIGBUS failure
> instead of Machine Check.
>

Yes.  I think the problem is some sort of corruption of the page tables. 
  This may show up as MachineCheck Errors, or bus errors, or SIGSEGV.

David.
