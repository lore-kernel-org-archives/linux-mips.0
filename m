Message-ID: <001201c12ab2$c7c4e700$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
Subject: question about syscall and interrupts......
Date: Wed, 22 Aug 2001 10:33:08 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010822023308.MOHxWacn1vbaXzsSo7Nh33jUniZ4-cP2kpckPTKSJeE@z>

Hello,
    I find that in handle_sys() of scall_o32.S, it calls:
        SAVE_SOME
    But in the various board interrupt handlers entry(int-handler.S), it
calls:
        SAVE_ALL

    So before entering syscall and interrupt handler entry, why do they need
save different registers? and interrupt need save more things than syscalls?

Thank you very much.

machael thailer
