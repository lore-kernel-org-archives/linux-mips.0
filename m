Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:36059 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992800AbdHHOP1BbZOe (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Aug 2017 16:15:27 +0200
Date: Tue, 8 Aug 2017 09:15:17 -0500
From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: Re: [PATCH 3/7] MIPS: NI 169445: Only include in 32r2el kernels
Message-ID: <20170808141517.GA27246@nathan3500-linux-VM>
References: <20170807230119.10629-1-paul.burton@imgtec.com>
 <20170807230119.10629-4-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20170807230119.10629-4-paul.burton@imgtec.com>
Return-Path: <nathan.sullivan@ni.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170808141517.WQHvDeabIMgilBbYZBKJl29mEo86_uw_AecGj1u5XUw@z>

On Mon, Aug 07, 2017 at 04:01:14PM -0700, Paul Burton wrote:
> The NI 169445 board uses a little endian MIPS32r2 CPU, and therefore
> including board support in kernels that are unable to run on such a CPU
> is pointless.
>

Acked-by: Nathan Sullivan <nathan.sullivan@ni.com>
