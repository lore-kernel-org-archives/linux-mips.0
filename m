Received: from mail3.caviumnetworks.com ([12.108.191.235]:10840 "EHLO
	mail3.caviumnetworks.com") by ftp.linux-mips.org with ESMTP
	id S22594246AbYJ1QOG (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 28 Oct 2008 16:14:06 +0000
Message-ID: <49073A38.3070808@caviumnetworks.com>
Date: Tue, 28 Oct 2008 09:13:44 -0700
From: Chad Reese <kreese@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 11/36] MIPSR2 ebase isn't just CAC_BASE
References: <1225152181-3221-2-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-3-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-4-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-5-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-6-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-7-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-8-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-9-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-10-git-send-email-ddaney@caviumnetworks.com> <1225152181-3221-11-git-send-email-ddaney@caviumnetworks.com> <20081028095655.GB18610@linux-mips.org> <alpine.LFD.1.10.0810281604250.27396@ftp.linux-mips.org>
In-Reply-To: <alpine.LFD.1.10.0810281604250.27396@ftp.linux-mips.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <Kenneth.Reese@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney@caviumnetworks.com>, linux-mips@linux-mips.org, Tomaso Paoletti <tpaoletti@caviumnetworks.com>
Message-ID: <20081028161344.fRt59Bzppav4n2u2WNV__sxLr1IOO5zYRlqRBOIzSRI@z>

Maciej W. Rozycki wrote:
> On Tue, 28 Oct 2008, Ralf Baechle wrote:
> 
>> Another thing I noticed is that we don't use write_c0_ebase(), so the
>> firmware better setup this correctly or we crash and burn.  We better
>> should initialize that right ...
> 
>  Well, your version still does not do it...
> 
>   Maciej
