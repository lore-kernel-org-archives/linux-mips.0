Received: from multi.imgtec.com ([194.200.65.239]:48764 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6824104Ab3IRL3VufV3Z (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 18 Sep 2013 13:29:21 +0200
Message-ID: <52398E51.6050306@imgtec.com>
Date: Wed, 18 Sep 2013 12:28:17 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Kconfig: CMP support needs to select SMP as well
References: <1378460846-961-1-git-send-email-markos.chandras@imgtec.com> <20130918111053.GK22468@linux-mips.org>
In-Reply-To: <20130918111053.GK22468@linux-mips.org>
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
Cc: linux-mips@linux-mips.org
Message-ID: <20130918112817.T3WNymu16aNOhbYJXSL5jIdd5-KBFHd3E6gZ79dSl9w@z>

On 09/18/13 12:10, Ralf Baechle wrote:
> On Fri, Sep 06, 2013 at 10:47:26AM +0100, Markos Chandras wrote:
>
>> The CMP code is only designed to work with SMP configurations.
>> Fixes multiple build problems on certain randconfigs:
>
> Applied - but I think the logic here may be backwards from a user's
> perspective.  Shouldn't a user be asked for SMP first, then for
> possible platform suboptions (CMP, VSMP, SMTC) of SMP?
>
>    Ralf
>
Hi Ralf,

Well, for example, you can have VSMP with or without CMP so CMP is not
another SMP option but rather an "add-on". However, it might be 
preferred to move the SMP option higher in the menu.
