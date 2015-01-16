Received: from unicorn.mansr.com ([81.2.72.234]:35690 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27010525AbbAPPFvMVXu0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jan 2015 16:05:51 +0100
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] MIPS: Changed current_thread_info() to an equivalent supported by both clang and GCC
References: <1420805177-9087-1-git-send-email-daniel.sanders@imgtec.com>
        <54AFC6F3.1020300@cogentembedded.com>
        <E484D272A3A61B4880CDF2E712E9279F458E68B8@hhmail02.hh.imgtec.org>
        <54B00F3C.8030903@gmail.com>
        <E484D272A3A61B4880CDF2E712E9279F458E7DF1@hhmail02.hh.imgtec.org>
        <54B069D4.4090608@gmail.com>
        <E484D272A3A61B4880CDF2E712E9279F458E8336@hhmail02.hh.imgtec.org>
        <20150116143725.GB22296@linux-mips.org>
Date: Fri, 16 Jan 2015 15:05:44 +0000
In-Reply-To: <20150116143725.GB22296@linux-mips.org> (Ralf Baechle's message
        of "Fri, 16 Jan 2015 15:37:25 +0100")
Message-ID: <yw1xvbk6epfb.fsf@unicorn.mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <mru@mansr.com>
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
Cc: Daniel Sanders <Daniel.Sanders@imgtec.com>, David Daney <ddaney.cavm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Paul Burton <Paul.Burton@imgtec.com>, Markos Chandras <Markos.Chandras@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Behan Webster <behanw@converseincode.com>
Message-ID: <20150116150544.HPlbklghuxbbhBnuvXjwpubG8AxxdFsHbSvJFSNwcUI@z>

Ralf Baechle <ralf@linux-mips.org> writes:

> On Sat, Jan 10, 2015 at 12:53:22PM +0000, Daniel Sanders wrote:
>
>> The main reason I renamed it is that identifiers starting with '__'
>> are reserved. It's pretty unlikely but it's possible that the name
>> will conflict with a C implementation in the future.
>
> The whole kernel is using identifiers starting with a double underscore
> left and right.  The risk should be acceptable though - also because the
> kernel isn't linked against external libraries.

The reserved namespace applies to applications built against a standard
library so as to avoid name clashes with library internals.  The kernel
doesn't use the standard library, so it can use any identifiers.  This
should be clear from the fact that the reserved identifiers are listed
in the "Library" chapter of the C standard.

-- 
Måns Rullgård
mans@mansr.com
